describe Hourly do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  def valid_hour_summary
    valid_attributes = {
      timestamp: Time.parse("2010-12-13T17:00:00Z"),
      enter_the_room: 0,
      leave_the_room: 0,
      high_five_another_user: 0,
      comment: 0
    }
    hourly = Hourly.new valid_attributes
    hourly
  end

  def valid_person(name='Bob')
    Person.new name: name
  end

  def valid_event(time=Time.parse("2010-12-13T17:01:00Z"), action_code=Event::ACTIONS.keys.first)
    event = Event.new(timestamp: time, action_code: action_code)
    event.subjects << valid_person
    event
  end

  it "exists" do
    Object.const_defined?('Hourly').should.be.true 
  end

  it "must respond to timestamp, entered_count, left_count, high_five_count and comment_count" do
    valid_hour_summary.should.respond_to :timestamp
    valid_hour_summary.should.respond_to :enter_the_room
    valid_hour_summary.should.respond_to :leave_the_room
    valid_hour_summary.should.respond_to :high_five_another_user
    valid_hour_summary.should.respond_to :comment
  end

  describe "#find" do
    it "finds the summary given an exact time" do
      time = Time.parse("2014-12-13T17:00:00Z")
      created_hourly = Hourly.new timestamp: time,
                                  enter_the_room: 0,
                                  leave_the_room: 0,
                                  high_five_another_user: 0,
                                  comment: 0
      cdq.save
      hourly = Hourly.find(time)
      hourly.timestamp.should.equal created_hourly.timestamp
    end

    it "creates the summary for an exact time if not found" do
      time = Time.parse("2014-12-13T17:00:00Z")
      hourly = Hourly.find(time)
      hourly.timestamp.should.equal time
    end
  end

  describe "#humanize" do
    it "gives a human friendly string" do
      summary = "0 people entered the room\n"
      summary << "0 people left the room\n"
      summary << "0 people high fived other users\n"
      summary << "0 people commented"
      valid_hour_summary.humanize.should.equal summary
    end

    it "shows the correct number of people that have entered" do
      summary = valid_hour_summary
      summary.enter_the_room = 2
      summary_text = "2 people entered the room"
      summary.humanize.should.include summary_text
    end

    it "shows the correct number of people that have left" do
      summary = valid_hour_summary
      summary.leave_the_room = 2
      summary_text = "2 people left the room"
      summary.humanize.should.include summary_text
    end

    it "shows the correct number of people that have high fived" do
      summary = valid_hour_summary
      summary.high_five_another_user = 2
      summary_text = "2 people high fived other users"
      summary.humanize.should.include summary_text
    end

    it "shows the correct number of people that have commented" do
      summary = valid_hour_summary
      summary.comment = 2
      summary_text = "2 people commented"
      summary.humanize.should.include summary_text
    end
  end

  describe "#update" do
    it "increments the action by one" do
      summary = valid_hour_summary
      initial_count = summary.enter_the_room
      event = valid_event
      cdq.save
      summary.update
      summary.enter_the_room.should.equal initial_count + 1
    end

    it "finds all events for that hour" do
      summary = valid_hour_summary
      valid_event(Time.parse("2010-12-13T17:00:00Z"))
      valid_event(Time.parse("2010-12-13T17:05:00Z"))
      valid_event(Time.parse("2010-12-13T17:15:00Z"))
      valid_event(Time.parse("2010-12-13T17:59:00Z"))
      cdq.save
      summary.update
      summary.enter_the_room.should.equal 4
    end
  end
end