module Seeds
  ####################
  # CRUDE SEEEEEDING #
  ####################
  def seed
    seed_last_year
    seed_last_month
    seed_last_week
    seed_today
    cdq.save
  end

  def seed_message(data={})
    @fixtures ||= begin
      # Yes, I'm using J.R.R Tolkien's invented language. Lorem is so cliché!
      texts = File.read(NSBundle.mainBundle.pathForResource("message_fixtures", ofType:"txt"))
      fixtures = texts.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet)
    end
    subject1 = Person.create( name: data[:subject1] )
    subject2 = Person.create( name: data[:subject2] ) if data[:subject2]
    event = Event.new timestamp: data[:date],
                      action_code: data[:action_code],
                      message: @fixtures[rand(@fixtures.size)]
    event.subjects << subject1
    event.subjects << subject2 if subject2
  end

  def seed_last_year
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2013-02-13T17:00:00Z"),
                 subject1: 'Bob'
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2013-02-13T17:01:00Z"),
                 subject1: 'Katie'
    seed_message action_code: 'comment',
                 date: Time.parse("2013-02-13T17:02:00Z"),
                 subject1: 'Bob'
    seed_message action_code: 'comment',
                 date: Time.parse("2013-02-13T17:04:00Z"),
                 subject1: 'Katie'
    seed_message action_code: 'high-five-another-user',
                 date: Time.parse("2013-02-13T17:06:00Z"),
                 subject1: 'Bob',
                 subject2: 'Katie'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2013-02-13T17:07:00Z"),
                 subject1: 'Bob'
    seed_message action_code: 'comment',
                 date: Time.parse("2013-02-13T17:08:00Z"),
                 subject1: 'Katie'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2013-02-13T17:10:00Z"),
                 subject1: 'Katie'
  end

  def seed_last_month
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2013-12-13T17:00:00Z"),
                 subject1: 'Jimmy'
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2013-12-13T17:01:00Z"),
                 subject1: 'Laura'
    seed_message action_code: 'comment',
                 date: Time.parse("2013-12-13T17:02:00Z"),
                 subject1: 'Jimmy'
    seed_message action_code: 'comment',
                 date: Time.parse("2013-12-13T17:04:00Z"),
                 subject1: 'Laura'
    seed_message action_code: 'high-five-another-user',
                 date: Time.parse("2013-12-13T17:06:00Z"),
                 subject1: 'Jimmy',
                 subject2: 'Laura'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2013-12-13T17:07:00Z"),
                 subject1: 'Jimmy'
    seed_message action_code: 'comment',
                 date: Time.parse("2013-12-13T17:08:00Z"),
                 subject1: 'Laura'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2013-12-13T17:10:00Z"),
                 subject1: 'Laura'
  end

  def seed_last_week
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2014-01-17T17:00:00Z"),
                 subject1: 'Terence'
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2014-01-17T17:01:00Z"),
                 subject1: 'Kelly'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-17T17:02:00Z"),
                 subject1: 'Terence'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-17T17:04:00Z"),
                 subject1: 'Kelly'
    seed_message action_code: 'high-five-another-user',
                 date: Time.parse("2014-01-17T17:06:00Z"),
                 subject1: 'Terence',
                 subject2: 'Kelly'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2014-01-17T17:07:00Z"),
                 subject1: 'Terence'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-17T17:08:00Z"),
                 subject1: 'Kelly'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2014-01-17T17:10:00Z"),
                 subject1: 'Kelly'
  end

  def seed_today
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2014-01-20T13:00:00Z"),
                 subject1: 'Romilly'
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2014-01-20T13:01:00Z"),
                 subject1: 'Sarah'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-20T13:02:00Z"),
                 subject1: 'Romilly'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-20T13:04:00Z"),
                 subject1: 'Sarah'
    seed_message action_code: 'high-five-another-user',
                 date: Time.parse("2014-01-20T13:06:00Z"),
                 subject1: 'Romilly',
                 subject2: 'Sarah'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2014-01-20T13:07:00Z"),
                 subject1: 'Romilly'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-20T13:08:00Z"),
                 subject1: 'Sarah'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2014-01-20T13:10:00Z"),
                 subject1: 'Sarah'

    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2014-01-20T17:00:00Z"),
                 subject1: 'Romilly'
    seed_message action_code: 'enter-the-room',
                 date: Time.parse("2014-01-20T17:01:00Z"),
                 subject1: 'Sarah'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-20T17:02:00Z"),
                 subject1: 'Romilly'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-20T17:04:00Z"),
                 subject1: 'Sarah'
    seed_message action_code: 'high-five-another-user',
                 date: Time.parse("2014-01-20T17:06:00Z"),
                 subject1: 'Romilly',
                 subject2: 'Sarah'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2014-01-20T17:07:00Z"),
                 subject1: 'Romilly'
    seed_message action_code: 'comment',
                 date: Time.parse("2014-01-20T17:08:00Z"),
                 subject1: 'Sarah'
    seed_message action_code: 'leave-the-room',
                 date: Time.parse("2014-01-20T17:10:00Z"),
                 subject1: 'Sarah'
  end
end