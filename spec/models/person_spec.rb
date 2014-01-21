describe Person do
  before do
    @person = Person.new name: 'Bob'
  end

  it "exists" do
    Object.const_defined?('Person').should.be.true 
  end

  it "has a name" do
    @person.should.respond_to :name
  end

  it "is valid with all attributes present" do
    @person.should.be.valid
  end

  describe "to be valid" do
    it "requires a name" do
      @person.name = nil
      @person.should.not.be.valid
    end
  end
end