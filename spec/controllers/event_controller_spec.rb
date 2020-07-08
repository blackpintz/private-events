require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user1) { FactoryBot.create(:user) }
  describe 'GET #show' do
    it 'renders show template' do
      Event.create!(description: 'Controller event', date: Date.today, creator_id: 1)
      get :show, params: { id: 1 }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    it 'redirects to root path when successful' do
      session[:user_id] = user1.id
      post :create, params: { event: { description: 'Controller event', date: Date.today } }
      expect(response).to redirect_to(root_url)
    end
  end
end
