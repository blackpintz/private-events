require 'rails_helper'

RSpec.describe UsersController, type: :controller do
     let(:user1) {FactoryBot.create(:user)}
     
     describe "GET #new" do
         it "renders new template" do
             get :new
             expect(response).to render_template(:new)
         end
     end
     
     describe "POST #create" do
         it "redirects to users show page" do
              post :create, params: {user: {name: "Rose"}}
              expect(response).to redirect_to(user_url(User.find_by(name: "Rose")))
         end
     end
     
     describe "GET #show" do
          it "renders show template" do
               get :show, params: {id: 1}
               expect(response).to render_template(:show)
          end
     end
    
end