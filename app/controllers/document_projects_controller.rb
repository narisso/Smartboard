class DocumentProjectsController < ApplicationController
  # GET /document_projects
  # GET /document_projects.json
  def index
    @project = Project.find(params[:project_id])
    @document_projects = DocumentProject.where(:project_id => params[:project_id])

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @document_projects }
    end
  end

  # GET /document_projects/1
  # GET /document_projects/1.json
  def show
    @document_project = DocumentProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_project }
    end
  end

  # GET /document_projects/new
  # GET /document_projects/new.json
  def new
    @document_project = DocumentProject.new
    @document_project.project = Project.find(params[:project_id])

    respond_to do |format|
      format.js
      format.json { render json: @document_project }
    end
  end

  # GET /document_projects/1/edit
  def edit
    @document_project = DocumentProject.find(params[:id])
  end

  # POST /document_projects
  # POST /document_projects.json
  def create

    @project = Project.find(params[:project_id])
    @document_project = DocumentProject.new({name: params[:document_project][:name], description: params[:document_project][:description] })
    @document_project.project = @project

    if @project.dropbox_token then
      if params[:document_project][:file] then
        require 'dropbox_sdk'
        file = params[:document_project][:file].read
        @file_path ="IIC2154/" + @project.name + "/" + params[:document_project][:file].original_filename
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
    @document_project = DocumentProject.find(params[:id])
    @document_project.destroy

    @document_projects = DocumentProject.where(:project_id => params[:project_id])

    respond_to do |format|
      format.js { render 'index', notice: 'Document removed successfully.' }
      format.json { head :no_content }
    end
  end
end
