# Manages requirement's templates information
class RequirementTemplatesController < ApplicationController
  
  # Gives the list of requirement's templates as JSon
  #
  # @return [String] the list of requirement's templates as JSon 
  def index
    @requirement_templates = RequirementTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirement_templates }
    end
  end

  # Gives information about a certain templates of a requirement
  #
  # @param id [String] the template's id
  # @return [String] the template's information as JSON
  def show
    @requirement_template = RequirementTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement_template }
    end
  end

  # Gives the template for creating a new template of a requirement
  #
  # @return [String] the information to fill about a new template of a requirement as a JSON
  def new
    @requirement_template = RequirementTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requirement_template }
    end
  end

  # Gives the template to edit the information of a requirement's template
  #
  # @param id [String] the template's id
  def edit
    @requirement_template = RequirementTemplate.find(params[:id])
  end

  # Creates the information for a new template of a requirement
  # 
  # @param requirement_template [RequirementTemplate] the template's information
  # @return [String] the status of the creation, and the information of the template as JSON
  def create
    @requirement_template = RequirementTemplate.new(params[:requirement_template])

    respond_to do |format|
      if @requirement_template.save
        format.html { redirect_to @requirement_template, notice: 'Requirement template was successfully created.' }
        format.json { render json: @requirement_template, status: :created, location: @requirement_template }
      else
        format.html { render action: "new" }
        format.json { render json: @requirement_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a template
  #
  # @param id [String] the id of the template of a requirement
  # @param requirement_template [RequirementTemplate] the information of the template from POST
  # @return [String] the status of the update, and the information of the template as JSON
  def update
    @requirement_template = RequirementTemplate.find(params[:id])

    respond_to do |format|
      if @requirement_template.update_attributes(params[:requirement_template])
        format.html { redirect_to @requirement_template, notice: 'Requirement template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requirement_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a template from a requirement from the BD
  #
  # @param id [String] the template's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @requirement_template = RequirementTemplate.find(params[:id])
    @requirement_template.destroy

    respond_to do |format|
      format.html { redirect_to requirement_templates_url }
      format.json { head :no_content }
    end
  end
end
