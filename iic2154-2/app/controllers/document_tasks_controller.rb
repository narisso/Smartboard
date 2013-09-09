class DocumentTasksController < ApplicationController
  # GET /document_tasks
  # GET /document_tasks.json
  def index
    @document_tasks = DocumentTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_tasks }
    end
  end

  # GET /document_tasks/1
  # GET /document_tasks/1.json
  def show
    @document_task = DocumentTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_task }
    end
  end

  # GET /document_tasks/new
  # GET /document_tasks/new.json
  def new
    @document_task = DocumentTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_task }
    end
  end

  # GET /document_tasks/1/edit
  def edit
    @document_task = DocumentTask.find(params[:id])
  end

  # POST /document_tasks
  # POST /document_tasks.json
  def create
    @document_task = DocumentTask.new(params[:document_task])

    respond_to do |format|
      if @document_task.save
        format.html { redirect_to @document_task, notice: 'Document task was successfully created.' }
        format.json { render json: @document_task, status: :created, location: @document_task }
      else
        format.html { render action: "new" }
        format.json { render json: @document_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_tasks/1
  # PUT /document_tasks/1.json
  def update
    @document_task = DocumentTask.find(params[:id])

    respond_to do |format|
      if @document_task.update_attributes(params[:document_task])
        format.html { redirect_to @document_task, notice: 'Document task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_tasks/1
  # DELETE /document_tasks/1.json
  def destroy
    @document_task = DocumentTask.find(params[:id])
    @document_task.destroy

    respond_to do |format|
      format.html { redirect_to document_tasks_url }
      format.json { head :no_content }
    end
  end
end
