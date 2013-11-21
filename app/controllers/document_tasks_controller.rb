# Manages the information of the documents of a task
class DocumentTasksController < ApplicationController
 load_and_authorize_resource :project
 load_and_authorize_resource :status, :through => :project
 load_and_authorize_resource :task, :through => :status
 load_and_authorize_resource :document_task, :through => :task

  # Gives the list of documents of the application associated to a task, as JSON
  #
  # @return [String] the list of documents associated to a task as JSon 
  def index
    @document_tasks = DocumentTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_tasks }
    end
  end

  # Gives information about a certain document of a task
  #
  # @param id [String] the document's id
  # @return [String] the document's information as JSON
  def show
    @document_task = DocumentTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_task }
    end
  end

  # Gives the template for creating a new document of a task
  #
  # @return [String] the information to fill about a new document of a task as a JSON
  def new
    @document_task = DocumentTask.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @document_task }
    end
  end

  # Gives the template to edit the information of a task's document
  #
  # @param id [String] the document's id
  def edit
    @document_task = DocumentTask.find(params[:id])
  end

  # Creates the information for a new document of a task
  # 
  # @param document_task [DocumentTask] the document's information
  # @return [String] the status of the creation, and the information of the document as JSON
  def create
    @document_task = DocumentTask.new(params[:document_task])
    @document_task.task = @task

    respond_to do |format|
      if @document_task.save
        format.html { redirect_to boards_project_path(@project), notice: 'Document task was successfully created.' }
        format.json { render json: @document_task, status: :created, location: @document_task }
      else
        format.html { render action: "new" }
        format.json { render json: @document_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a document
  #
  # @param id [String] the id of the document of a task
  # @param document_task [DocumentTask] the information of the document from POST
  # @return [String] the status of the update, and the information of the document as JSON
  def update
    @document_task = DocumentTask.find(params[:id])

    respond_to do |format|
      if @document_task.update_attributes(params[:document_task])
        format.html { redirect_to @document_task, notice: 'Document task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a document from a task from the BD
  #
  # @param id [String] the document's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @document_task = DocumentTask.find(params[:id])
    @document_task.destroy

    respond_to do |format|
      format.html { redirect_to document_tasks_url }
      format.json { head :no_content }
    end
  end
end
