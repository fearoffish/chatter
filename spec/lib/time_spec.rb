describe Time do
  it "should parse date/time string" do
    time = Time.parse('2012-05-13T22:05:39Z')
    time.year.should == 2012
    time.month.should == 5
    time.day.should == 13
    time.hour.should == 22
    time.min.should == 5
    time.sec.should == 39
  end
  
  describe 'ago_in_words' do
    it "should return 'just now' for few seconds" do
      Time.ago_in_words(1).should == 'just now'
      Time.ago_in_words(5).should == 'just now'
      Time.ago_in_words(10).should == 'just now'
    end

    it "should return 'less than a minute ago' for less than 60 seconds" do
      Time.ago_in_words(30).should == 'less than a minute ago'
      Time.ago_in_words(45).should == 'less than a minute ago'
      Time.ago_in_words(50).should == 'less than a minute ago'
    end

    it "should return number of minutes for less than 3600 seconds" do
      Time.ago_in_words(1200).should == '20 minutes ago'
      Time.ago_in_words(1230).should == '20 minutes ago'
      Time.ago_in_words(2400).should == '40 minutes ago'
    end

    it "should return number of hours for few less than 86400 seconds" do
      Time.ago_in_words(4000).should == '1 hours ago'
      Time.ago_in_words(7200).should == '2 hours ago'
      Time.ago_in_words(7400).should == '2 hours ago'
      Time.ago_in_words(86400).should == '24 hours ago'
    end

    it "should return number of days for more than 86400 seconds" do
      Time.ago_in_words(86500).should == '1 days ago'
      Time.ago_in_words(100000).should == '1 days ago'
    end
  end

  describe 'future_in_words' do
    it "should return 'very soon' for few seconds" do
      Time.future_in_words(1).should == 'very soon'
      Time.future_in_words(5).should == 'very soon'
      Time.future_in_words(10).should == 'very soon'
    end

    it "should return 'in less than a minute' for less than 60 seconds" do
      Time.future_in_words(30).should == 'in less than a minute'
      Time.future_in_words(45).should == 'in less than a minute'
      Time.future_in_words(50).should == 'in less than a minute'
    end

    it "should return number of minutes for less than 3600 seconds" do
      Time.future_in_words(1200).should == 'in 20 minutes'
      Time.future_in_words(1230).should == 'in 20 minutes'
      Time.future_in_words(2400).should == 'in 40 minutes'
    end

    it "should return number of hours for few less than 86400 seconds" do
      Time.future_in_words(4000).should == 'in 1 hours'
      Time.future_in_words(7200).should == 'in 2 hours'
      Time.future_in_words(7400).should == 'in 2 hours'
      Time.future_in_words(86400).should == 'in 24 hours'
    end

    it "should return number of days for more than 86400 seconds" do
      Time.future_in_words(86500).should == 'in 1 days'
      Time.future_in_words(100000).should == 'in 1 days'
    end
  end

  describe "same_hour?" do
    it "should return true for the same hour" do
      date1 = Time.parse("2014-01-01T12:00:00Z")
      date2 = Time.parse("2014-01-01T12:59:00Z")
      Time.same_hour?( date1, date2 ).should.equal true
    end

    it "should not be true for different days" do
      date1 = Time.parse("2014-01-02T12:00:00Z")
      date2 = Time.parse("2014-01-01T12:59:00Z")
      Time.same_hour?( date1, date2 ).should.equal false
    end

    it "should not be true for different months" do
      date1 = Time.parse("2014-02-01T12:00:00Z")
      date2 = Time.parse("2014-01-01T12:59:00Z")
      Time.same_hour?( date1, date2 ).should.equal false
    end

    it "should not be true for different years" do
      date1 = Time.parse("2013-01-01T12:00:00Z")
      date2 = Time.parse("2014-01-01T12:59:00Z")
      Time.same_hour?( date1, date2 ).should.equal false
    end
  end
end