require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) { User.create(email: "test", password: "testpass") }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end

  describe "#is_password?" do
    context "when password is incorrect" do
      it "should return false" do
        expect(test_user.is_password?("wrongpass")).to be false
      end
    end

    context "when password is corrent" do
      it "should return true" do
        expect(test_user.is_password?("testpass")).to be true
      end
    end
  end

  describe "#reset_session_token!" do
    it "should replace user session token" do
      original_token = test_user.session_token
      expect(test_user.session_token).to eq(original_token)
      test_user.reset_session_token!
      expect(test_user.session_token).not_to eq(original_token)
    end
  end

  describe "::find_by_credentials" do
    context "when user does not exist" do
      it "should return nil" do
        result = User.find_by_credentials("missinguser", "missingpass")
        expect(result).to be nil
      end
    end

    context "when credentials are wrong" do
      it "should return nil" do
        User.create(email: "cred_test", password: "testpass")
        result = User.find_by_credentials("cred_test", "wrongpass")
        expect(result).to be nil
      end
    end

    context "when credentials are correct" do
      it "should return user" do
        test_user = User.create(email: "cred_test", password: "testpass")
        result = User.find_by_credentials("cred_test", "testpass")
        expect(result).to eq(test_user)
      end
    end
  end
  
  
  
end
