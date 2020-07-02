require 'rails_helper'

RSpec.describe Event, type: :model do
    let(:today) {Date.parse("02/09/2020")}
    let(:event1) {FactoryBot.create(:event, date: Date.parse("10/10/2019"))}
    let(:event2) { FactoryBot.create(:event, date: Date.parse("10/9/2020"))}
    describe "associations" do
        it {should belong_to(:creator).class_name('User')}
        it {should have_many(:invitations).with_foreign_key('attended_event_id')}
        it {should have_many(:attendees).through(:invitations)}
        
    end
    
    describe "class methods" do
        describe "::past" do
            it "return past events with respect to the present date" do
           expect(Event.past(today)).to include(event1)
           expect(Event.past(today)).to_not include(event2)
            end
        end
        
        describe "::future" do
            it "returns future events with respect to the present date" do
                expect(Event.future(today)).to include(event2)
                expect(Event.future(today)).to_not include(event1)
            end
        end
    end
end


