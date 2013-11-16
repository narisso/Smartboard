# Manages the information of the documents of a project
class DocumentProjectsController < ApplicationController
  # Gives the list of documents of a certain project as JSon
  #
  # @param project_id [String] the id of a project
  # @return [String] the list of labels as JSon 
  def index
    @project = Project.find(params[:project_id])
    @document_projects = DocumentProject.where(:project_id => params[:project_id])

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @document_projects }
    end
  end

  # Gives information about a certain document of a project
  #
  # @param id [String] the document's id
  # @return [String] the label's information as JSON
  def show
    @document_project = DocumentProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_project }
    end
  end

  # Gives the template for creating a new document of a project
  #
  # @param project_id [String] the project's id
  # @return [String] the information to fill about a new document of a project as a JSON
  def new
    @document_project = DocumentProject.new
    @document_project.project = Project.find(params[:project_id])

    respond_to do |format|
      format.js
      format.json { render json: @document_project }
    end
  end

  # Gives the template to edit a document's information of a project
  #
  # @param id [String] the document's id
  def edit
    @document_project = DocumentProject.find(params[:id])
  end

  # Creates the information for a new document of a project, and upload it to Dropbox repository
  # 
  # @param project_id [String] the project's id
  # @param document_project [DocumentProject] the document's information, which contains name, description and file
  # @return [String] the status of the creation, and the information of the label as JSON
  def create
    @project = Project.find(params[:project_id])
    @document_project = DocumentProject.create_and_upload({name: params[:document_project][:name], description: params[:document_project][:description]}, params[:document_project][:file])
    
    respond_to do |format|
      if @document_project.save
        format.html { redirect_to boards_project_path(@document_project.project_id) }
        format.json { render json: @document_project, status: :created, location: @document_project }
      else
        format.html { redirect_to boards_project_path(@document_project.project_id) }
        format.json { render json: @document_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a label
  #
  # @param id [String] the if of the document of a project
  # @param document_project [DocumentProject] the information of the label from POST
  # @return [String] the status of the update, and the information of the label as JSON
  def update
    @document_project = DocumentProject.find(params[:id])

    respond_to do |format|
      if @document_project.update_attributes(params[:document_project])
        format.js { redirect_to project_document_projects_path(@document_project.project), notice: 'Document project was successfully updated.' }
        format.json { head :no_content }
      else
        format.js { render action: "edit" }
        format.json { render json: @document_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a document from a project
  #
  # @param id [String] the document's id
  # @param project_id [String] theid of the project that contains the document
  # @return [String] the content of the deletion as JSON
  def destroy
    @project = Project.find(params[:project_id])
    @document_project = DocumentProject.find(params[:id])
    @document_project.destroy

    @document_projects = DocumentProject.where(:project_id => params[:project_id])

    respond_to do |format|
      format.js { render 'index', notice: 'Document removed successfully.' }
      format.json { head :no_content }
    end
  end
end
