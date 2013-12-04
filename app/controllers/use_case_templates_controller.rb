# Manages the information of the use case's templates
class UseCaseTemplatesController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :use_case_template, :through => :project
  # Gives the list of templates of use case of a project
  #
  # @param project_id [String] the project's id
  # @return [String] the list of templates of the project as JSon
  def index
    @use_case_templates = UseCaseTemplate.where(:project_id => params[:project_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @use_case_templates }
    end
  end

  # Gives information about a certain template of use case
  #
  # @param id [String] the template's id
  # @return [String] the template's information as JSON
  def show
    @use_case_template = UseCaseTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @use_case_template }
    end
  end

  # Gives the template for creating a new template of a use case
  #
  # @param project_id [String] the id of the project that contains the template
  # @return [String] the information to fill about a new template as a JSON
  def new
    @use_case_template = UseCaseTemplate.new
    @use_case_template.project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @use_case_template }
    end
  end

  # Gives the template for edit a template of a use case
  #
  # @param id [String] the template's id
  def edit
    @use_case_template = UseCaseTemplate.find(params[:id])
  end

  # Creates the information for a new template of use cases
  #
  # @param use_case_template [UseCaseTemplate] the information of the new template from POST
  # @param project_id [String] the id of the project that contains the template
  # @param parameters [String] the parameters of the template given from POST
  # @return [String] the status of the creation, and the information of the role as JSON
  def create
    @use_case_template = UseCaseTemplate.new(params[:use_case_template])
    @use_case_template.project = Project.find(params[:project_id])
    @use_case_template.template_form = params[:parameters].to_json

    respond_to do |format|
      if @use_case_template.save
        format.html { redirect_to project_use_case_templates_path(@project), notice: 'Use case template was successfully created.' }
        format.json { render json: @use_case_template, status: :created, location: @use_case_template }
      else
        format.html { render action: "new" }
        format.json { render json: @use_case_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a role
  #
  # @param id [String] the role's id
  # @param role [Role] the information of the role from POST
  # @return [String] the status of the update, and the information of the role as JSON
  def update
    @use_case_template = UseCaseTemplate.find(params[:id])

    respond_to do |format|
      if @use_case_template.update_attributes(params[:use_case_template])
        format.html { redirect_to @use_case_template, notice: 'Use case template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @use_case_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a template of a use case from the application and redirects the webpage
  #
  # @param id [String] the template's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @use_case_template = UseCaseTemplate.find(params[:id])
    @use_case_template.destroy

    respond_to do |format|
      format.html { redirect_to project_use_case_templates_path @project }
      format.json { head :no_content }
    end
  end
end