# Manages the information of the documents of a use case
class DocumentUseCasesController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :use_case, :through => :project
  load_and_authorize_resource :document_use_case, :through => :use_case

  # Gives the list of documents of the application associated to a use case, as JSON
  #
  # @return [String] the list of documents associated to a task as JSon 
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_use_cases }
    end
  end

  # Gives information about a certain document of a use case
  #
  # @param id [String] the document's id
  # @return [String] the document's information as JSON
  def show
    @document_use_case = DocumentUseCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_use_case }
    end
  end

  # Gives the template for creating a new document of a use case
  #
  # @return [String] the information to fill about a new document of a use case as a JSON
  def new
    @document_use_case = DocumentUseCase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_use_case }
    end
  end

  # Gives the template to edit the informatio of a use case's document
  #
  # @param id [String] the document's id
  def edit
    @document_use_case = DocumentUseCase.find(params[:id])
  end

  # Creates the information for a new document of a use case
  # 
  # @param document_use_case [DocumentUseCase] the document's information
  # @return [String] the status of the creation, and the information of the document as JSON
  def create
    @document_use_case = DocumentUseCase.new(params[:document_use_case])
    @document_use_case.use_case = @use_case

    respond_to do |format|
      if @document_use_case.save
        format.html { redirect_to project_use_case_path(@project, @use_case), notice: 'Document use case was successfully created.' }
        format.json { render json: @document_use_case, status: :created, location: @document_use_case }
      else
        format.html { render action: "new" }
        format.json { render json: @document_use_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a document
  #
  # @param id [String] the id of the document of a use case
  # @param document_use_case [DocumentUseCase] the information of the document from POST
  # @return [String] the status of the update, and the information of the document as JSON
  def update
    @document_use_case = DocumentUseCase.find(params[:id])

    respond_to do |format|
      if @document_use_case.update_attributes(params[:document_use_case])
        format.html { redirect_to @document_use_case, notice: 'Document use case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_use_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a document from a use case from the BD
  #
  # @param id [String] the document's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @document_use_case = DocumentUseCase.find(params[:id])
    @document_use_case.destroy

    respond_to do |format|
      format.html { redirect_to document_use_cases_url }
      format.json { head :no_content }
    end
  end
end
