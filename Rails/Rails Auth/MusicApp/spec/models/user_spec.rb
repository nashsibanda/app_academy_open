require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end

  describe "#is_password?" do
    context "when password is incorrect" do
      it "should return false" do
        # Write some basic RSpec tests
      end
    end
  end
  
end
