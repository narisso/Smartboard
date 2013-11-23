# Manages Use Case's information
class UseCasesController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :use_case, :through => :project
  
  # Gives the list of use cases as JSon
  #
  # @return [String] the list of use cases as JSon 
  def index
    @use_case_groups = @project.use_case_groups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @use_cases }
    end
  end

  # Gives information about a certain use case
  #
  # @param id [String] the use case's id
  # @return [String] the use case's information as JSON
  def show
    @use_case = UseCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @use_case }
    end
  end

  # Gives the template for creating a new use case
  #
  # @return [String] the information to fill about a new use case as a JSON
  def new
    @use_case = UseCase.new
    @use_case.project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @use_case }
    end
  end

  # Gives the template for edit a use case
  #
  # @param id [String] the use case's id
  def edit
    @use_case = UseCase.find(params[:id])
  end

  # Creates the information for a new use case
  #
  # @param use case [UseCase] the information of the new use case from POST
  # @param project_id [String] the project id
  # @return [String] the status of the creation, and the information of the use case as JSON
  def create
    @use_case = UseCase.new(params[:use_case])
    @use_case.project_id = params[:project_id]
    @use_case.data = params[:data].to_json

    respond_to do |format|
      if @use_case.save
        format.html { redirect_to requirements_project_use_case_path(@use_case.project, @use_case,:type => "step"), notice: 'Use case was successfully created.' }
        format.json { render json: @use_case, status: :created, location: @use_case }
      else
        format.html { render action: "new" }
        format.json { render json: @use_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a use case
  #
  # @param id [String] the use case's id
  # @param use case [UseCase] the information of the use case from POST
  # @return [String] the status of the update, and the information of the use case as JSON
  def update
    @use_case = UseCase.find(params[:id])
    @use_case.data = params[:data].to_json

    respond_to do |format|
      if @use_case.update_attributes(params[:use_case])

        if params[:subaction]=="step"
          format.html { redirect_to requirements_project_use_case_path(@use_case.project, @use_case, :type=>"step"), notice: 'Use case was successfully updated.' }
        else
          format.html { redirect_to project_use_case_path(@project, @use_case), notice: 'Use case was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @use_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a use case of the application
  #
  # @param id [String] the use case's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @use_case = UseCase.find(params[:id])
    @use_case.destroy

    respond_to do |format|
      format.html { redirect_to project_use_cases_path @project }
      format.json { head :no_content }
    end
  end

  # Gives the template of an use case as JSON
  #
  # @param use_case_template_id [String] the use case template's id
  # @return [String] the use case template as JSON
  def template_use_case
    @use_case_template = UseCaseTemplate.find(params[:use_case_template_id])
    @json_obj = JSON.parse(@use_case_template.template_form)

    respond_to do |format|
      format.js {render 'template_form'}
    end
  end

  # Gives the list of documents of a project to attach to a use case
  #
  # @param id [String] the use case's id
  # @param project_id [String] the project's id
  def attach_document
    @use_case = UseCase.find(params[:id])
    @document_projects = DocumentProject.where(:project_id => params[:project_id])

    respond_to do |format|
      format.html 
    end
  end

  # Adds or removes a document of a use of case
  #
  # @param id [String] the use case's id
  # @param document_project_id [String] the document's id
  # @param add [String] Indicates if you want to add (add = true) or remove (add = false) a document.
  # @param project_id [String] the project's id
  def add_document
    @use_case = UseCase.find(params[:id])
    document_project = DocumentProject.find(params[:project_id])
    text = @use_case.add_remove_document(document_project,params[:add])
    flash[:notice] = text
    respond_to do |format|
      format.js
    end
  end

  # Gives the view of the requirement of a certain use case
  #
  # @param id [String] the use case's id
  # @param project_id [String] the project's id
  def requirements
  @use_case = UseCase.find(params[:id])
  @project = @use_case.project
  @requirements = @use_case.requirements
    respond_to do |format|
      format.html 
    end
  end

  # Gives the view of the tasks of a certain use case
  #
  # @param id [String] the use case's id
  # @param project_id [String] the project's id
  def tasks
  @use_case = UseCase.find(params[:id])
  @project = @use_case.project
    respond_to do |format|
      format.html 
    end
  end






end
