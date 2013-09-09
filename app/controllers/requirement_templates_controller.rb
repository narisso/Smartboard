class RequirementTemplatesController < ApplicationController
  # GET /requirement_templates
  # GET /requirement_templates.json
  def index
    @requirement_templates = RequirementTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirement_templates }
    end
  end

  # GET /requirement_templates/1
  # GET /requirement_templates/1.json
  def show
    @requirement_template = RequirementTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement_template }
    end
  end

  # GET /requirement_templates/new
  # GET /requirement_templates/new.json
  def new
    @requirement_template = RequirementTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requirement_template }
    end
  end

  # GET /requirement_templates/1/edit
  def edit
    @requirement_template = RequirementTemplate.find(params[:id])
  end

  # POST /requirement_templates
  # POST /requirement_templates.json
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

  # PUT /requirement_templates/1
  # PUT /requirement_templates/1.json
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

  # DELETE /requirement_templates/1
  # DELETE /requirement_templates/1.json
  def destroy
    @requirement_template = RequirementTemplate.find(params[:id])
    @requirement_template.destroy

    respond_to do |format|
      format.html { redirect_to requirement_templates_url }
      format.json { head :no_content }
    end
  end
end
