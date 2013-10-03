require 'spec_helper'

describe User do
  it "should be valid when new" do
    @user = User.new({email: "1234@1234.1234", password: "12341234", password_confirmation: "12341234"})
    @user.should be_valid
  end

  it "should not be valid if invalid email" do
    @user = User.new({email: "12341234.1234", password: "12341234", password_confirmation: "12341234"})
    @user.should_not be_valid
  end
end
