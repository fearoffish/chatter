schema "0001 initial" do

  entity "Event" do
    datetime  :timestamp,   optional: false
    string    :action_code, optional: false
    string    :message,     optional: true

    has_many :subjects, inverse: 'Person.events'
  end

  entity "Person" do
    string :name, optional: false

    has_many :events, inverse: 'Event.subjects'
  end

  entity "Hourly" do
    datetime  :timestamp
    integer32 :enter_the_room
    integer32 :leave_the_room
    integer32 :high_five_another_user
    integer32 :comment
  end

  entity "Daily" do
    datetime  :timestamp
    integer32 :enter_the_room
    integer32 :leave_the_room
    integer32 :high_five_another_user
    integer32 :comment
  end
end