require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:test_user) { FactoryBot.create(:user) }
  let(:test_goal) { FactoryBot.create(:goal, user_id: test_user.id ) }

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title) }
    
    it "should validate deadline not in past" do
      FactoryBot.use_parent_strategy = false
      expect(FactoryBot.build(:goal)).to be_valid
      expect(FactoryBot.build(:goal, deadline:"2019-12-02")).not_to be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:user) } 
  end

  describe "#overdue?" do
    context "with passed deadline" do
      it "should return true" do
        passed_goal = FactoryBot.create(:goal, :deadline_passed)
        expect(passed_goal.overdue?).to be true 
      end
    end

    context "with deadline of today or in the future" do
      it "should return false" do
        expect(FactoryBot.create(:goal).overdue?).to be false  
      end
    end
    
  end
  
  
  
end
