# Manages the information of the statuses of a project
# Manages the information of the status of certain project
class ProjectStatusesController < ApplicationController
  # Gives the list of statuses of the application as JSon
  #
  # @return [String] the list of statuses and the project they are associated to, as JSon 
  def index
    @project_statuses = ProjectStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_statuses }
    end
  end

  # Gives information about a certain status of a project
  #
  # @param id [String] the id of the relation of a status and a project
  # @return [String] the relation's information as JSON
  def show
    @project_status = ProjectStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_status }
    end
  end

  # Gives the template for creating a new status of a project
  #
  # @return [String] the information to fill about a new status of a project as a JSON
  def new
    @project_status = ProjectStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_status }
    end
  end

  # Gives the template for edit a status
  #
  # @param id [String] the id of the relation of a status and a project
  def edit
    @project_status = ProjectStatus.find(params[:id])
  end

  # Creates the information for a new status
  #
  # @param project_status [ProjectStatus] the information of the new status of a project from POST
  # @return [String] the status of the creation, and the information of the evaluation as JSON
  def create
    @project_status = ProjectStatus.new(params[:project_status])

    respond_to do |format|
      if @project_status.save
        format.html { redirect_to @project_status, notice: 'Project status was successfully created.' }
        format.json { render json: @project_status, status: :created, location: @project_status }
      else
        format.html { render action: "new" }
        format.json { render json: @project_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a relation between a status and a project
  #
  # @param id [String] the relation's id
  # @param project_status [ProjectStatus] the information of the relation from POST
  # @return [String] the status of the update, and the information of the relation as JSON
  def update
    @project_status = ProjectStatus.find(params[:id])

    respond_to do |format|
      if @project_status.update_attributes(params[:project_status])
        format.html { redirect_to @project_status, notice: 'Project status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a relation between a status and a project of the application
  #
  # @param id [String] the relation's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @project_status = ProjectStatus.find(params[:id])
    @project_status.destroy

    respond_to do |format|
      format.html { redirect_to project_statuses_url }
      format.json { head :no_content }
    end
  end
end
