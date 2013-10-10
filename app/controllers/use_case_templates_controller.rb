class UseCaseTemplatesController < ApplicationController
  # GET /use_case_templates
  # GET /use_case_templates.json
  def index
    @use_case_templates = UseCaseTemplate.where(params[:project_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @use_case_templates }
    end
  end

  # GET /use_case_templates/1
  # GET /use_case_templates/1.json
  def show
    @use_case_template = UseCaseTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @use_case_template }
    end
  end

  # GET /use_case_templates/new
  # GET /use_case_templates/new.json
  def new
    @use_case_template = UseCaseTemplate.new
    @use_case_template.project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @use_case_template }
    end
  end

  # GET /use_case_templates/1/edit
  def edit
    @use_case_template = UseCaseTemplate.find(params[:id])
  end

  # POST /use_case_templates
  # POST /use_case_templates.json
  def create
    @use_case_template = UseCaseTemplate.new(params[:use_case_template])
    @use_case_template.project = Project.find(params[:project_id])
    @use_case_template.template_form = params[:parameters].to_json

    respond_to do |format|
      if @use_case_template.save
        format.html { redirect_to [@use_case_template.project, @use_case_template], notice: 'Use case template was successfully created.' }
        format.json { render json: @use_case_template, status: :created, location: @use_case_template }
      else
        format.html { render action: "new" }
        format.json { render json: @use_case_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /use_case_templates/1
  # PUT /use_case_templates/1.json
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

  # DELETE /use_case_templates/1
  # DELETE /use_case_templates/1.json
  def destroy
    @use_case_template = UseCaseTemplate.find(params[:id])
    @use_case_template.destroy

    respond_to do |format|
      format.html { redirect_to use_case_templates_url }
      format.json { head :no_content }
    end
  end
end
