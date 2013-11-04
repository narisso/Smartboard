class DocumentUseCasesController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :use_case, :through => :project
  load_and_authorize_resource :document_use_case, :through => :use_case

  # GET /document_use_cases
  # GET /document_use_cases.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_use_cases }
    end
  end

  # GET /document_use_cases/1
  # GET /document_use_cases/1.json
  def show
    @document_use_case = DocumentUseCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_use_case }
    end
  end

  # GET /document_use_cases/new
  # GET /document_use_cases/new.json
  def new
    @document_use_case = DocumentUseCase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_use_case }
    end
  end

  # GET /document_use_cases/1/edit
  def edit
    @document_use_case = DocumentUseCase.find(params[:id])
  end

  # POST /document_use_cases
  # POST /document_use_cases.json
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

  # PUT /document_use_cases/1
  # PUT /document_use_cases/1.json
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

  # DELETE /document_use_cases/1
  # DELETE /document_use_cases/1.json
  def destroy
    @document_use_case = DocumentUseCase.find(params[:id])
    @document_use_case.destroy

    respond_to do |format|
      format.html { redirect_to document_use_cases_url }
      format.json { head :no_content }
    end
  end
end
