class UseCasesController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :use_case, :through => :project
  
  # GET /use_cases
  # GET /use_cases.json
  def index
    @use_case_groups = @project.use_case_groups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @use_cases }
    end
  end

  # GET /use_cases/1
  # GET /use_cases/1.json
  def show
    @use_case = UseCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @use_case }
    end
  end

  # GET /use_cases/new
  # GET /use_cases/new.json
  def new
    @use_case = UseCase.new
    @use_case.project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @use_case }
    end
  end

  # GET /use_cases/1/edit
  def edit
    @use_case = UseCase.find(params[:id])
  end

  # POST /use_cases
  # POST /use_cases.json
  def create
    @use_case = UseCase.new(params[:use_case])
    @use_case.project_id = params[:project_id]
    @use_case.data = params[:data].to_json

    respond_to do |format|
      if @use_case.save
        format.html { redirect_to requirements_project_use_case_path(@use_case.project, @use_case), notice: 'Use case was successfully created.' }
        format.json { render json: @use_case, status: :created, location: @use_case }
      else
        format.html { render action: "new" }
        format.json { render json: @use_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /use_cases/1
  # PUT /use_cases/1.json
  def update
    @use_case = UseCase.find(params[:id])
    @use_case.data = params[:data].to_json

    respond_to do |format|
      if @use_case.update_attributes(params[:use_case])
        format.html { redirect_to project_use_case_path(@project, @use_case), notice: 'Use case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @use_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /use_cases/1
  # DELETE /use_cases/1.json
  def destroy
    @use_case = UseCase.find(params[:id])
    @use_case.destroy

    respond_to do |format|
      format.html { redirect_to project_use_cases_path @project }
      format.json { head :no_content }
    end
  end

  def template_use_case
    @use_case_template = UseCaseTemplate.find(params[:use_case_template_id])
    @json_obj = JSON.parse(@use_case_template.template_form)

    respond_to do |format|
      format.js {render 'template_form'}
    end
  end

  def attach_document
    @use_case = UseCase.find(params[:id])
    @document_projects = DocumentProject.where(:project_id => params[:project_id])

    respond_to do |format|
      format.html 
    end
  end

  def add_document
    @use_case = UseCase.find(params[:id])
    @document_project = DocumentProject.find(params[:document_project_id])

    if params[:add] == "true"
      @use_case.add_document(@document_project)
      flash[:notice] = "Document added to use case."
    else
      @use_case.remove_document(@document_project)
      flash[:notice] = "Document removed from use case."
    end

    respond_to do |format|
      format.js
    end
  end

  def requirements
  @use_case = UseCase.find(params[:id])
  @project = @use_case.project
  @requirements = Requirement.where(:use_case_id => @use_case.id)
    respond_to do |format|
      format.html 
    end
  end

  def tasks
  @use_case = UseCase.find(params[:id])
  @project = @use_case.project

    respond_to do |format|
      format.html 
    end
  end


end
