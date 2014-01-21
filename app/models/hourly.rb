class Hourly < CDQManagedObject
  include StringHelpers

  def self.find(time)
    start_hour = time.beginning_of_hour
    end_hour   = time.end_of_hour
    hourly = Hourly.where("timestamp >= %@", start_hour).and("timestamp <= %@", end_hour).first
    hourly ? hourly : Hourly.create(timestamp: time)
  end

  def update
    start_hour = timestamp.beginning_of_hour
    end_hour   = timestamp.end_of_hour
    
    events = Event.where("timestamp >= %@", start_hour).and("timestamp <= %@", end_hour)
    summary = Hash.new(0)
    events.each do |event|
      summary[event.action_code] += 1
    end

    summary.each do |action_code, count|
      method = action_code.gsub('-', '_')
      self.send("#{method}=", count)
    end
    cdq.save
  end

  def self.handleDataModelChange(notification)
    notification.userInfo.each do |change, events|
      case change
      when 'managedObjectContext'
        # ignore
      else
        events.each do |object|
          if object.kind_of? Event
            hourly = Hourly.find(object.timestamp)
            hourly.update
          end
        end
      end
    end
  end

  def humanize
    summary =  "#{pluralize(enter_the_room, 'person', 'people')} entered the room\n"
    summary << "#{pluralize(leave_the_room, 'person', 'people')} left the room\n"
    summary << "#{pluralize(high_five_another_user, 'person', 'people')} high fived other users\n"
    summary << "#{pluralize(comment, 'person', 'people')} commented"
  end
end