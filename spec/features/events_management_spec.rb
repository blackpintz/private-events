require 'rails_helper'

feature 'events features', type: :feature do
  feature 'making a new event' do
    before(:each) do
      User.create(name: 'Allan')
      visit '/login'
      fill_in 'session[name]', with: 'Allan'
      click_on 'Log in'
    end

    scenario 'create a new event' do
      visit '/events/new'
      fill_in 'event[description]', with: 'A test event.'
      click_on 'Create Event'
      expect(page).to have_content('A test event.')
      expect(current_path).to eq('/')
    end
  end

  feature 'seeing all events' do
    before(:all) do
      @events = [Event.create(description: 'test1 event', date: Date.parse('10/10/2019'), creator_id: 1),
                 Event.create(description: 'test2 event', date: Date.parse('10/09/2020'), creator_id: 1)]
    end
    scenario 'viewing the events index page' do
      visit root_url
      @events.each do |event|
        expect(page).to have_content(event.description)
      end
    end
  end

  feature 'seeing one event' do
    before(:all) do
      @user = FactoryBot.create(:user)
      @event = Event.create(description: 'test3 event', date: Date.parse('10/09/2020'), creator_id: User.find_by(name: 'Lisa').id)
      Invitation.create(attendee_id: @user.id, attended_event_id: @event.id)
    end
    scenario 'viewing a single event page' do
      visit event_url(@event.id)
      expect(page).to have_content(@user.name)
    end
  end
end
