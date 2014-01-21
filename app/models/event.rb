class Event < CDQManagedObject

  ACTIONS = { 
    "enter-the-room"         => ":subject1 enters the room",
    "leave-the-room"         => ":subject1 leaves the room",
    "comment"                => ":subject1 comments: :message",
    "high-five-another-user" => ":subject1 high fives :subject2"
  }
 
  # simple replacements for now
  def humanize
    string = action
    string.gsub!(/\:message/, message || '')
    string.gsub!(/\:subject1/, subject1 ? subject1.name : '')
    string.gsub!(/\:subject2/, subject2 ? subject2.name : '')
    string
  end

  def action
    (ACTIONS[action_code] || "no-action").dup
  end

  def action=(new_action)
    action_code = new_action
  end

  def subject1
    subjects.to_a[0]
  end

  def subject2
    subjects.to_a[1]
  end

  # Validations
  def valid?
    timestamp_valid? && action_code_valid? && subject1_valid? && message_valid?
  end

  private

    def timestamp_valid?
      return false if timestamp.nil?
      return false if !timestamp.kind_of?(NSDate)
      true
    end

    def action_code_valid?
      return false if action_code.nil?
      return false unless ACTIONS.keys.include? action_code
      true
    end

    def subject1_valid?
      return false if subject1.nil?
      return false unless subject1.kind_of?(Person)
      true
    end

    def message_valid?
      return false if action_code == 'comment' && message.nil?
      true
    end

end