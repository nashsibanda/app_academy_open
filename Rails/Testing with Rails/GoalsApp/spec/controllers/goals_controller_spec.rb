require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  before(:each) do |example|
    unless example.metadata[:skip_before]
      @test_user = FactoryBot.create(:random_user)
      @current_user = @test_user
      allow_any_instance_of(GoalsController).to receive(:current_user).and_return(@test_user)
    end
  end

  describe "GET #new" do
    it "renders the new goal page" do
      get :new, params: { user_id: @test_user.id }
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
   context "with invalid new goal" do
     it "renders the new goal page with errors" do
      # No title should be invalid goal
      post :create, params: { goal: { details: Faker::Lorem.paragraph } }
      expect(response).to redirect_to new_user_goal_url(@current_user)
      expect(flash[:errors]).to be_present
    end
  end
  
  context "with valid new goal" do
    it "renders the goal show page for the new goal" do
      post :create, params: { goal: { title: Faker::Lorem.sentence, details: Faker::Lorem.paragraph } }
      expect(response).to redirect_to goal_url(Goal.last.id)
     end
   end
   
  end
  

  describe "GET #show" do
    it "renders the goal show page" do
      test_goal = FactoryBot.create(:goal)
      get :show, params: { id: test_goal.id }
      expect(response).to render_template("show")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    context "with incorrect current user" do
      it "redirects to show page of goal's user" do
        test_goal = FactoryBot.create(:random_goal)
        allow(controller).to receive(:current_user).and_return(@test_user)
        get :edit, params: { id: test_goal.id }
        expect(response).to redirect_to user_url(test_goal.user)
        expect(flash[:errors]).to be_present
      end
    end

    context "with correct current user" do
      it "renders the edit page for the goal" do
        test_goal = FactoryBot.create(:random_goal)
        allow(controller).to receive(:current_user).and_return(test_goal.user)
        get :edit, params: { id: test_goal.id }
        expect(response).to render_template("edit")
      end
    end
    
  end

  describe "DELETE #delete" do
    context "with an existing goal" do
      it "renders the goal index page" do
        test_goal = FactoryBot.create(:goal)
        delete :destroy, params: { id: test_goal.id }
        expect(response).to redirect_to goals_url
        expect(flash[:notice]).to be_present
      end
    end

    context "with a non-existent goal" do
      it "renders the goal index page with an error" do
        delete :destroy, params: { id: 193848921 }
        expect(response).to redirect_to goals_url
        expect(flash[:errors]).to be_present
      end
    end
    
    

  end
end
