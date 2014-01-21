# Depressingly I don't know how to mock an Apple supplied object, I thought 
# this would work, but I need to dig more.

# describe 'ObserveEvents' do
#   before do
#     class << self
#       include ObserveEvents
#     end
#   end

#   it "should add an observer for event changes" do
#     NSNotificationCenter.defaultCenter.mock!(:addObserver)
#     observe_events('cdq.contexts.current')
#   end
# end