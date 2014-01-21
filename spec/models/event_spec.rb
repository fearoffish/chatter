describe 'Event' do
  
  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Event entity' do
    Event.entity_description.name.should == 'Event'
  end

  def valid_person
    Person.create name: 'Bob'
  end
  
  def valid_event
    valid_attributes = {
      timestamp: NSDate.date,
      action_code: 'enter-the-room'
    }
    event = Event.new valid_attributes
    event.subjects << valid_person
    event
  end
    
  it "exists" do
    Object.const_defined?('Event').should.be.true 
  end

  it "is valid with all attributes present" do
    valid_event.should.be.valid
  end

  it "must respond to timestamp, action, subject1 and subject2" do
    valid_event.should.respond_to :timestamp
    valid_event.should.respond_to :action
    valid_event.should.respond_to :subject1
    valid_event.should.respond_to :subject2
  end

  it "must have 4 action types" do
    Event::ACTIONS.should.be.kind_of Hash
    Event::ACTIONS.size.should.equal 4
  end

  describe "to be valid" do
    it "must have a timestamp" do
      event = valid_event
      event.timestamp = nil
      event.should.not.be.valid
    end

    it "must have an action" do
      event = valid_event
      event.action_code = nil
      event.should.not.be.valid
    end

    it "must have at least 1 subject" do
      event = Event.new timestamp: NSDate.date,
                        action_code: 'enter-the-room'
      event.should.not.be.valid
    end

    it "must have an action_code from the action_code list" do
      event = valid_event
      event.action_code = 'not on the list'
      event.should.not.be.valid
    end

    it "must have a message when the action is 'comment'" do
      event = valid_event
      event.action_code = 'comment'
      event.should.not.be.valid
    end
  end

  describe "#humanize" do
    it "gives a human friendly string for the 'enter-the-room' action" do
      event = valid_event
      event.action_code = 'enter-the-room'
      event.humanize.should.equal "Bob enters the room"
    end
  end
end