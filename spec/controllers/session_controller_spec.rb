require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user1) { User.create(name: 'Joy') }
  describe 'POST #create' do
    context 'With valid params' do
      it 'logins a user' do
        post :create, params: { session: { name: user1.name } }
        expect(response).to redirect_to(user_url(User.find_by(name: user1.name)))
      end
    end

    context 'With invalid params' do
      it 'renders the login template' do
        post :create, params: { session: { name: 'Rose' } }
        expect(response).to render_template(:new)
      end
    end
  end
end
