# Manages requirement's documents information
class DocumentRequirementsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :requirement, :through => :project
  load_and_authorize_resource :document_requirement, :through => :requirement
 
  # Gives the list of requirement's documents as JSon
  #
  # @return [String] the list of labels as JSon 
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_requirements }
    end
  end

  # Gives information about a certain requirement's document
  #
  # @param id [String] the document's id
  # @return [String] the document's information as JSON
  def show
    @document_requirement = DocumentRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_requirement }
    end
  end

  # Gives the template for creating a new requirement's document
  #
  # @param project_id [String] the project's id
  # @return [String] the information to fill about a new document as a JSON
  def new
    @document_requirement = DocumentRequirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_requirement }
    end
  end

  # Gives the template to edit a document's information
  #
  # @param id [String] the document's id
  def edit
    @document_requirement = DocumentRequirement.find(params[:id])
  end

  # Creates the information for a new requirement document
  # 
  # @param document_requirement [DocumentRequirement] the document's information
  # @return [String] the status of the creation, and the information of the document as JSON
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

  # Changes the information of a document
  #
  # @param id [String] the if of the document of a requirement
  # @param document_requirement [DocumentRequirement] the information of the document from POST
  # @return [String] the status of the update, and the information of the document as JSON
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

  # Deletes a document from a requirement
  #
  # @param id [String] the document's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @document_requirement = DocumentRequirement.find(params[:id])
    @document_requirement.destroy

    respond_to do |format|
      format.html { redirect_to project_requirements_url(@project) }
      format.json { head :no_content }
    end
  end
end
