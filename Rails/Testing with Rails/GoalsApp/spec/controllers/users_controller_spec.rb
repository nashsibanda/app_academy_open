require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "renders the user index page" do
      get :index, {}
      expect(response).to render_template("index")
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET #new" do
    it "renders the user sign-up page" do
      get :new, {}
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
   context "with invalid new user" do
     it "renders the user sign-up page with errors" do
      post :create, params: { user: { email: "shortpassuser", password: "123" } }
      expect(response).to redirect_to new_user_url
      expect(flash[:errors]).to be_present
    end
  end
  
  context "with valid new user" do
    it "renders the user show page for the new user" do
      post :create, params: { user: { email: "validuser", password: "validpass" } }
      expect(response).to redirect_to user_url(User.last)
     end
   end
   
  end
  

  describe "GET #show" do
    it "renders the user show page" do
      test_user = FactoryBot.create(:user)
      get :show, params: { id: test_user.id }
      expect(response).to render_template("show")
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #delete" do
    context "with an existing user" do
      it "renders the user index page" do
        test_user = FactoryBot.create(:user)
        delete :destroy, params: { id: test_user.id }
        expect(response).to redirect_to users_url
        expect(flash[:notice]).to be_present
      end
    end

    context "with a non-existent user" do
      it "renders the user index page with an error" do
        delete :destroy, params: { id: 193848921 }
        expect(response).to redirect_to users_url
        expect(flash[:errors]).to be_present
      end
    end
    
    

  end
  
  
  
end
