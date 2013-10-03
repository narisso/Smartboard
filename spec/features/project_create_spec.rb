require 'spec_helper'

describe "Project create", :type => :feature do 

	it "should be successful if it has a nonblank name" do
		empty_user_records
		u=create_confirmed_user_and_sign_in

		visit '/projects/new'

		within("#new_project") do
			fill_in 'project_name', :with => 'Proyectotest'
		end

		click_button "Create Project"

		page.should have_content "Proyectotest"

	end
end
