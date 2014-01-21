class Daily < CDQManagedObject
  include StringHelpers

  def self.find(time)
    start_day = time.beginning_of_day
    end_day   = time.end_of_day
    daily = Daily.where("timestamp >= %@", start_day).and("timestamp <= %@", end_day).first
    daily ? daily : Daily.create(timestamp: time)
  end

  def update
    start_day = timestamp.beginning_of_day
    end_day   = timestamp.end_of_day
    
    events = Event.where("timestamp >= %@", start_day).and("timestamp <= %@", end_day)
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
            daily = Daily.find(object.timestamp)
            daily.update
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