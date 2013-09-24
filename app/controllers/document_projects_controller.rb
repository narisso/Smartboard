class DocumentProjectsController < ApplicationController
  # GET /document_projects
  # GET /document_projects.json
  def index
    @document_projects = DocumentProject.all

    respond_to do |format|
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
      format.html # new.html.erb
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
    @document_project = DocumentProject.new(params[:document_project])
    @document_project.project = Project.find(params[:project_id])

    respond_to do |format|
      if @document_project.save
        format.html { redirect_to [@document_project.project, @document_project], notice: 'Document project was successfully created.' }
        format.json { render json: @document_project, status: :created, location: @document_project }
      else
        format.html { render action: "new" }
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
        format.html { redirect_to [@document_project.project, @document_project], notice: 'Document project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_projects/1
  # DELETE /document_projects/1.json
  def destroy
    @document_project = DocumentProject.find(params[:id])
    @document_project.destroy

    respond_to do |format|
      format.html { redirect_to document_projects_url }
      format.json { head :no_content }
    end
  end
end
