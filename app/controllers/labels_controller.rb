# Manages label's information
class LabelsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :label, :through => :project

  # Gives the list of labels of the application as JSon
  #
  # @return [String] the list of labels as JSon 
  def index
    @labels = @project.labels

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @labels }
    end
  end

  # Gives information about a certain label
  #
  # @param id [String] the label's id
  # @return [String] the label's information as JSON
  def show
    @label = Label.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @label }
    end
  end

  # Gives the template for creating a new label
  #
  # @return [String] the information to fill about a new label as a JSON
  def new
    @label = Label.new
    @label.project = Project.find(params[:project_id])
    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @label }
    end
  end

  # Gives the template for edit a label
  #
  # @param id [String] the label id
  def edit
    @label = Label.find(params[:id])
  end

  # Creates the information for a new label
  #
  # @param label [Label] the information of the new label from POST
  # @return [String] the status of the creation, and the information of the label as JSON
  def create
    @label = Label.new(params[:label])

    respond_to do |format|
      if @label.save
        format.js { render :js => "location.reload();" }
        format.html { redirect_to project_labels_path(@label.project), notice: 'Label was successfully created.' }
        format.json { render json: @label, status: :created, location: @label }
      else
        format.html { render action: "new" }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a label
  #
  # @param id [String] the label id
  # @param label [Label] the information of the label from POST
  # @return [String] the status of the update, and the information of the label as JSON
  def update
    @label = Label.find(params[:id])

    respond_to do |format|
      if @label.update_attributes(params[:label])
        format.html { redirect_to project_labels_path(@label.project), notice: 'Label was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a label of the application
  #
  # @param id [String] the label's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @label = Label.find(params[:id])

    if @label.valid_destroy
      respond_to do |format|
        format.html { redirect_to project_labels_path(@project) }
        format.json { head :no_content }
      end
    else 
      respond_to do |format|
        format.html { redirect_to project_labels_path(@project), alert: 'First delete or change tasks with this label.' }
        format.json { head @label.json}
      end
    end
  end
end
