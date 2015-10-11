require_relative '../spec_helper'

describe User do

  let(:user) {create(:user)}

  describe 'User Attributes' do
    it "has a username" do
      expect(user.username).to be_truthy
    end
    it "has a password" do
      expect(user.password_digest).to be_truthy
    end
  end

  describe "Password Hashing" do
    it "hashes the users password" do
      expect(user.password_digest).not_to eq user.password
    end
  end

  describe "User Creation" do
    it "creates a user with valid input" do
      expect(User.new(username: "tom", password: "tomtom")).to be_valid
    end
    it "doesn't create a user with invalid input" do
      expect(User.new(username: "tom")).not_to be_valid
      expect(User.new(password: "tomtom")).not_to be_valid
    end
  end

end
