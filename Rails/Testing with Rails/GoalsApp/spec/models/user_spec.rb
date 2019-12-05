require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) { FactoryBot.create(:user) } 

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password) }
  end

  describe "associations" do
    it "should validate any relevant associations"
  end

  describe "::find_by_credentials" do
    context "with non-existent user" do
      it "should return nil" do
        result = User.find_by_credentials("missingemail", "missingpass")
        expect(result).to be nil
      end
    end
    
    context "with invalid credentials" do
      it "should return nil" do
        result = User.find_by_credentials("test", "wrongpass")
        expect(result).to be nil
      end
    end
    
    context "with valid credentials" do
      it "should return user with those credentials" do
        result = User.find_by_credentials("test", "testpass")
        expect(result).to eq(User.last)
      end
    end

  end
  
  describe "::generate_session_token" do
    it "should return a session token" do
      expect(User.generate_session_token).to be_instance_of(String)
    end
  end
  

  describe "#is_password?" do
    context "with incorrect password" do
      it "should return false" do
        expect(test_user.is_password?("wrongpass")).to be false
      end
    end
    
    context "with correct password" do
      it "should return true" do
        expect(test_user.is_password?("testpass")).to be true
      end
    end
    
  end

  describe "#reset_session_token!" do
    it "should replace user's session token" do
      old_token = test_user.session_token
      test_user.reset_session_token!
      expect(test_user.session_token).not_to eq(old_token)
    end
  end

  describe "#generate_activation_token!" do
    it "should assign activation token to user" do
      expect(test_user.activation_token).to be nil
      test_user.generate_activation_token!
      expect(test_user.activation_token).not_to be nil
    end
  end
  
  
  
end
