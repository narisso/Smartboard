require 'spec_helper'

describe Project do

	it "should be valid with a nonblank name" do
	  @project = Project.new({name: "hola"})
	  @project.should be_valid	
	end

	it "should not be valid when missing name" do
	  @project = Project.new
	  @project.should_not be_valid	
	  @project.name="  "
	  @project.should_not be_valid
	end

end
