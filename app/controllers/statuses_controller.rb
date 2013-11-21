# Manages Statu's information
class StatusesController < ApplicationController
  # Gives the list of status as JSon
  #
  # @return [String] the list of status as JSon 
  def index
    @statuses = Status.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # Gives information about a certain status
  #
  # @param id [String] the status' id
  # @return [String] the status' information as JSON
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end

  # Gives the template for creating a new status
  #
  # @return [String] the information to fill about a new status as a JSON
  def new
    @status = Status.new
    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @status }
    end
  end

  # Gives the template for edit a status
  #
  # @param id [String] the status' id
  def edit
    @status = Status.find(params[:id])
  end

  # Creates the information for a new status
  #
  # @param status [Status] the information of the new status from POST
  # @return [String] the status of the creation, and the information of the status as JSON
  def create
    @status = Status.new(params[:status])
    @project= Project.find(params[:project_id])
    @status.project_id = params[:project_id]
    aux = Status.last.id+1
    @status.set_default_name(aux)
    respond_to do |format|
      if @status.save
        format.html { redirect_to boards_project_path(@project) }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a status
  #
  # @param id [String] the status' id
  # @param status [Status] the information of the status from POST
  # @return [String] the status of the update, and the information of the status as JSON
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a status of the application
  #
  # @param id [String] the status' id
  # @return [String] the content of the deletion as JSON
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to statuses_url }
      format.json { head :no_content }
    end
  end

  # Gives the list of status of a certain project as JSon
  #
  # @param project_id [String] the project's id
  # @return [String] the list of status as JSon 
 def project_statuses
    @statuses=Status.where(:project_id => params[:id])
    respond_to do |format|
      format.html # project_statuses.html.erb
      format.json { render json: @statusess }
    end
  end

  # Updates the position of certain status of a project
  #
  # @param id [String] the project's id
  # @param status_id [String] the status' id
  # @param num [String] the new position of the status
  def update_order
      @project = Project.find(params[:id])
      @status = Status.find(params[:status_id]);
      @status.order = params[:num]
      @status.save
    respond_to do |format|
      if @status.save
        format.js { render :js => "" }
        format.json { head :no_content }
      else
        format.js { render :js => "alert('error')" }
        format.json { head :no_content }
      end
    end
  end

end
