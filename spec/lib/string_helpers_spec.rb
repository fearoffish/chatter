describe Time do
  before do
    class << self
      include StringHelpers
    end
  end

  describe "pluralize" do
    it "should be 'people' for 0 people" do
      pluralize(0, 'person', 'people').should.equal '0 people'
    end

    it "should be 'person' for 1 person" do
      pluralize(1, 'person', 'people').should.equal '1 person'
    end

    it "should be 'people' for 2 people" do
      pluralize(2, 'person', 'people').should.equal '2 people'
    end
  end
end