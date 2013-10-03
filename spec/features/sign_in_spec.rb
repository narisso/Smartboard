require 'spec_helper'

describe "Sign in", :type => :feature do
	before :each do
		empty_user_records
		@user = create_confirmed_user
	end

	it "should be succesful" do
		visit '/users/sign_in'
		within("#new_user") do
			fill_in 'user_email', :with => @user.email
			fill_in 'user_password', :with => @user.password
		end
		click_button 'Sign in'
		page.should have_content "Signed in successfully"


	end

	it "should not succeed if invalid email or password" do
		visit '/users/sign_in'
		within("#new_user") do
			fill_in 'user_email', :with => @user.email
			fill_in 'user_password', :with => 'sldnsaidhioasjdiasji'
		end
		click_button 'Sign in'
		page.should have_content "Invalid email or password"

	end


end
