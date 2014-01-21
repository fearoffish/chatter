class Person < CDQManagedObject
  
  def valid?
    name_valid?
  end

  private

    def name_valid?
      return false if name.blank?
      true
    end
end