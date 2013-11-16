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

  # Creates the information for a new document of a project
  # FALTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
  # @param project_id [String] the project's id
  # @param document_project [DocumentProject] the document's information
  # @return [String] the status of the creation, and the information of the label as JSON
  def create

    @project = Project.find(params[:project_id])
    @document_project = DocumentProject.new({name: params[:document_project][:name], description: params[:document_project][:description]})
    @document_project.project = @project
    docs =  DocumentProject.find_all_by_name(@document_project.name)
    
    unless docs.empty? then
      @document_project.version = docs[docs.length-1].version + 1
    end

    @document_project.origin = "web"

    if @project.dropbox_token then
      if params[:document_project][:file] then
        require 'dropbox_sdk'
        file = params[:document_project][:file].read
        whole_name = params[:document_project][:file].original_filename
        final_name = @document_project.name + ".v" + @document_project.version.to_s + File.extname(whole_name)
        @file_path ="SmartBoard/" + @project.name + "/" + final_name
        dbsession = DropboxSession.deserialize(@project.dropbox_token)
        client = DropboxClient.new(dbsession)
        response = client.put_file(@file_path, file)
        link = client.shares(response["path"])
        @document_project.url_path = link["url"]
      end
    else
      flash[:alert] = "No cloud storage linked"
    end

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

  # PUT /document_projects/1
  # PUT /document_projects/1.json
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

  # DELETE /document_projects/1
  # DELETE /document_projects/1.json
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
