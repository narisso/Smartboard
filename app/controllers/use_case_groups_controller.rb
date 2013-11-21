# Manages the information of the use case groups
class UseCaseGroupsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :use_case_group, :through => :project

  # Gives the list of groups of use cases
  #
  # @return [String] the list of groups as JSon 
  def index
    @use_case_groups = @project.use_case_groups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @use_case_groups }
    end
  end

 # Gives information about a certain group of use cases
  #
  # @param id [String] the group's id
  # @return [String] the group's information as JSON
  def show
    @use_case_group = UseCaseGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @use_case_group }
    end
  end

  # Gives the template for creating a new group of use cases
  #
  # @return [String] the information to fill about a new group as a JSON
  def new
    @use_case_group = UseCaseGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @use_case_group }
    end
  end

  # Gives the template for edit a group of use cases
  #
  # @param id [String] the group's id
  def edit
    @use_case_group = UseCaseGroup.find(params[:id])
  end

  # Creates the information for a new group of use cases
  #
  # @param use_case_group [UseCaseGroup] the information of the new group from POST
  # @param project_id [String] the id of the project that contain the group of use cases
  # @return [String] the status of the creation, and the information of the group as JSON
  def create
    @use_case_group = UseCaseGroup.new(params[:use_case_group])
    @use_case_group.project = Project.find(params[:project_id])

    respond_to do |format|
      if @use_case_group.save
        format.html { redirect_to project_use_cases_path @project, notice: 'Use case group was successfully created.' }
        format.json { render json: @use_case_group, status: :created, location: @use_case_group }
      else
        format.html { render action: "new" }
        format.json { render json: @use_case_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a group of use cases
  #
  # @param id [String] the group's id
  # @param use_case_group [UseCaseGroup] the information of the group from POST
  # @return [String] the status of the update, and the information of the role as JSON
  def update
    @use_case_group = UseCaseGroup.find(params[:id])

    respond_to do |format|
      if @use_case_group.update_attributes(params[:use_case_group])
        format.html { redirect_to @use_case_group, notice: 'Use case group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @use_case_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a group of use cases of the application
  #
  # @param id [String] the group's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @use_case_group = UseCaseGroup.find(params[:id])
    @use_case_group.destroy

    respond_to do |format|
      format.html { redirect_to use_case_groups_url }
      format.json { head :no_content }
    end
  end
end
