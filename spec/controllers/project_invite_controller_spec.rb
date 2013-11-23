require 'spec_helper'

describe ProjectInviteController do

  describe "GET 'invite'" do
    it "returns http success" do
      get 'invite'
      response.should be_success
    end
  end

  describe "GET 'accept'" do
    it "returns http success" do
      get 'accept'
      response.should be_success
    end
  end

  describe "GET 'reject'" do
    it "returns http success" do
      get 'reject'
      response.should be_success
    end
  end

end
