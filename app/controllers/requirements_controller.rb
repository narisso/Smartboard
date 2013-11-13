class RequirementsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :requirement, :through => :project
  # GET /requirements
  # GET /requirements.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirements }
    end
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/new
  # GET /requirements/new.json
  def new
    @requirement = Requirement.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement = Requirement.find(params[:id])
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(params[:requirement])
    @requirement.project = @project

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to project_requirements_path(@project), notice: 'Requirement was successfully created.' }
        format.json { render json: @requirement, status: :created, location: @requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.json
  def update
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      if @requirement.update_attributes(params[:requirement])
        format.html { redirect_to project_requirements_path(@project), notice: 'Requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement = Requirement.find(params[:id])
    @requirement.destroy

    respond_to do |format|
      format.html { redirect_to project_requirements_url(@project) }
      format.json { head :no_content }
    end
  end

  def attach_document
    @requirement = Requirement.find(params[:id])
    @document_projects = DocumentProject.where(:project_id => @project)

    respond_to do |format|
      format.html 
    end
  end

  def add_document
    @requirement = Requirement.find(params[:id])
    @document_project = DocumentProject.find(params[:document_project_id])

    if params[:add] == "true"
      @requirement.add_document(@document_project)
      flash[:notice] = "Document added to requirement."
    else
      @requirement.remove_document(@document_project)
      flash[:notice] = "Document removed from requirement."
    end

    respond_to do |format|
      format.js
    end
  end

end
