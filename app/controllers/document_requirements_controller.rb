# Manages requirement's documents information
class DocumentRequirementsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :requirement, :through => :project
  load_and_authorize_resource :document_requirement, :through => :requirement
 
  # Gives the list of requirement's documents as JSon
  #
  # @return [String] the list of documments as JSon 
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_requirements }
    end
  end

  # Gives information about a certain document
  #
  # @param id [String] the document id
  # @return [String] the document's information as JSON
  def show
    @document_requirement = DocumentRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_requirement }
    end
  end

  # GET /document_requirements/new
  # GET /document_requirements/new.json
  def new
    @document_requirement = DocumentRequirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_requirement }
    end
  end

  # GET /document_requirements/1/edit
  def edit
    @document_requirement = DocumentRequirement.find(params[:id])
  end

  # POST /document_requirements
  # POST /document_requirements.json
  def create
    @document_requirement = DocumentRequirement.new(params[:document_requirement])
    @document_requirement.requirement = @requirement

    respond_to do |format|
      if @document_requirement.save
        format.html { redirect_to project_requirements_path(@project), notice: 'Document requirement was successfully created.' }
        format.json { render json: @document_requirement, status: :created, location: @document_requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @document_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_requirements/1
  # PUT /document_requirements/1.json
  def update
    @document_requirement = DocumentRequirement.find(params[:id])

    respond_to do |format|
      if @document_requirement.update_attributes(params[:document_requirement])
        format.html { redirect_to @document_requirement, notice: 'Document requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_requirements/1
  # DELETE /document_requirements/1.json
  def destroy
    @document_requirement = DocumentRequirement.find(params[:id])
    @document_requirement.destroy

    respond_to do |format|
      format.html { redirect_to project_requirements_url(@project) }
      format.json { head :no_content }
    end
  end
end
