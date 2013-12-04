# Manages requirement's information
class RequirementsController < ApplicationController

  load_and_authorize_resource :project, :except => :create
  load_and_authorize_resource :requirement, :through => :project, :except => :create
  # Gives the list of requirements as JSon
  #
  # @return [String] the list of requirements as JSon 
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirements }
    end
  end

  # Gives information about a certain requirement
  #
  # @param id [String] the requirement's id
  # @return [String] the requirement's information as JSON
  def show
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement }
    end
  end

  # Gives the template for creating a new requirement
  #
  # @return [String] the information to fill about a new requirement as a JSON
  def new
    @requirement = Requirement.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @requirement }
    end
  end

  # Gives the template for edit a requirement
  #
  # @param id [String] the requirement's id
  def edit
    params[:type] = ""
    @requirement = Requirement.find(params[:id])
  end

  # Creates the information for a new requirement
  #
  # @param requirement [Requirement] the information of the new requirement from POST
  # @return [String] the status of the creation, and the information of the requirement as JSON
  def create
    @project = Project.find(params[:project_id])
    @requirement = Requirement.new( {name: params[:requirement][:name], description: params[:requirement][:description]} )
    @requirement.project = @project
    respond_to do |format|
      if @requirement.save
        @requirement_use_case = RequirementUseCase.new({requirement_id: @requirement.id, use_case_id: params[:requirement][:use_case_id] })
        @requirement_use_case.save
        format.js { render :js => "location.reload();" }
        format.html { redirect_to project_requirements_path(@project), notice: 'Requirement was successfully created.' }
        format.json { render json: @requirement, status: :created, location: @requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a requirement
  #
  # @param id [String] the requirement id
  # @param requirement [Requirement] the information of the requirement from POST
  # @return [String] the status of the update, and the information of the requirement as JSON
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

  # Deletes a requirement of the application
  #
  # @param id [String] the requirement's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @requirement = Requirement.find(params[:id])
    @requirement.destroy

    respond_to do |format|
      format.html { redirect_to project_requirements_url(@project) }
      format.json { head :no_content }
    end
  end

  # Gives the list of documents of a project to attach to a requirement
  # @param id [String] the requirement's id
  # @param project_id [String] the project's id
  def attach_document
    @requirement = Requirement.find(params[:id])
    @document_projects = DocumentProject.where(:project_id => @project)
    respond_to do |format|
      format.html 
    end
  end

  # Adds or removes a document of a requirement
  #
  # @param id [String] the requirement's id
  # @param document_project_id [String] the document's id
  # @param add [String] Indicates if you want to add (add = true) or remove (add = false) a document.
  # @param project_id [String] the project's id
  def add_document
    @requirement = Requirement.find(params[:id])
    document_project = DocumentProject.find(params[:project_id])
    text = @requirement.add_remove_document(document_project,params[:add])
    flash[:notice] = text
    respond_to do |format|
      format.js
    end
  end

  # Adds Use Case to a requirement
  #
  # @param id [String] the requirement's id
  # @param use_case_id [String] the use case's id
  # @param project_id [String] the project's id
  def add_use_case
    @requirement = Requirement.find(params[:id])
    use_case = UseCase.find(params[:use_case_id])
    @requirement.use_cases << use_case
    @requirement.save
    respond_to do |format|
      if(params[:type])
        format.html {redirect_to requirements_project_use_case_path(@project, use_case, :type=>"step") }
      else
         format.html {redirect_to requirements_project_use_case_path(@project, use_case) }
      end
    end
  end

end
