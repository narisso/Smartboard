class LabelsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :label, :through => :project


  # GET /labels
  # GET /labels.json
  def index
    @labels = @project.labels

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @labels }
    end
  end

  # GET /labels/1
  # GET /labels/1.json
  def show
    @label = Label.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @label }
    end
  end

  # GET /labels/new
  # GET /labels/new.json
  def new
    @label = Label.new
    @label.project = Project.find(params[:project_id])
    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @label }
    end
  end

  # GET /labels/1/edit
  def edit
    @label = Label.find(params[:id])
  end

  # POST /labels
  # POST /labels.json
  def create
    @label = Label.new(params[:label])

    respond_to do |format|
      if @label.save
        format.html { redirect_to project_labels_path(@label.project), notice: 'Label was successfully created.' }
        format.json { render json: @label, status: :created, location: @label }
      else
        format.html { render action: "new" }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /labels/1
  # PUT /labels/1.json
  def update
    @label = Label.find(params[:id])

    respond_to do |format|
      if @label.update_attributes(params[:label])
        format.html { redirect_to @label, notice: 'Label was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labels/1
  # DELETE /labels/1.json
  def destroy
    @label = Label.find(params[:id])
    @label.destroy

    respond_to do |format|
      format.html { redirect_to project_labels_path(@project) }
      format.json { head :no_content }
    end
  end
end
