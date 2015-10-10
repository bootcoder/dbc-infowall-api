require_relative '../spec_helper'

describe User do

  let(:user) {User.create(username: "tom", password: "tomtom")}

  describe 'User Attributes' do
    it "has a username" do
      expect(user.username).to eq 'tom'
    end
  end

end
