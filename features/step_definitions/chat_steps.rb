Given /^I am on the All Chat screen$/ do
  element_exists("navigationBar label marked:'All Chat'")
end

Given /^I am on the Hourly screen$/ do
  element_exists("navigationBar label marked:'Hourly'")
end

When /^I press the "(.*?)" tabBarButton$/ do |tab_name|
  touch("tabBarButton marked:'#{tab_name}'")
end

Then /^I can see detailed events$/ do
  step %Q{I can see "Romilly" entered the room at "5:00:00 PM"}
  step %Q{I can see "Sarah" entered the room at "5:01:00 PM"}
  step %Q{I can see "Romilly" leaves a comment at "5:02:00 PM"}
  step %Q{I can see "Sarah" leaves a comment at "5:04:00 PM"}
  step %Q{I can see "Romilly" high fives "Sarah" at "5:06:00 PM"}
  step %Q{I can see "Romilly" leaves the room at "5:07:00 PM"}
  step %Q{I can see "Sarah" leaves a comment at "5:08:00 PM"}
  step %Q{I can see "Sarah" leaves the room at "5:10:00 PM"}
end

Then /^I can see "([^\"]*)" entered the room at "([^\"]*)"$/ do |person, time|
  element_exists("tableViewCell label {text CONTAINS '#{time}")
  element_exists("tableViewCell label {text CONTAINS '#{person} enters the room'}")
end

Then /^I can see "(.*?)" leaves a comment at "(.*?)"$/ do |person, time|
  element_exists("tableViewCell label {text CONTAINS '#{time}")
  element_exists("tableViewCell label {text CONTAINS '#{person} comments'}")
end

Then /^I can see "([^\"]*)" leaves a comment of "([^\"]*)" at "([^\"]*)"$/ do |person, comment, time|
  element_exists("tableViewCell label {text CONTAINS '#{time}")
  element_exists("tableViewCell label {text CONTAINS '#{person} comments: #{comment}'}")
end

Then /^I can see "([^\"]*)" high fives "([^\"]*)" at "([^\"]*)"$/ do |person1, person2, time|
  element_exists("tableViewCell label {text CONTAINS '#{time}")
  element_exists("tableViewCell label {text CONTAINS '#{person1} high fives #{person2}'}")
end

Then /^I can see "([^\"]*)" leaves the room at "([^\"]*)"$/ do |person, time|
  element_exists("tableViewCell label {text CONTAINS '#{time}")
  element_exists("tableViewCell label {text CONTAINS '#{person} leaves the room'}")
end