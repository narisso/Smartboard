class UseCaseGroupsController < ApplicationController
  # GET /use_case_groups
  # GET /use_case_groups.json
  def index
    @use_case_groups = UseCaseGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @use_case_groups }
    end
  end

  # GET /use_case_groups/1
  # GET /use_case_groups/1.json
  def show
    @use_case_group = UseCaseGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @use_case_group }
    end
  end

  # GET /use_case_groups/new
  # GET /use_case_groups/new.json
  def new
    @use_case_group = UseCaseGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @use_case_group }
    end
  end

  # GET /use_case_groups/1/edit
  def edit
    @use_case_group = UseCaseGroup.find(params[:id])
  end

  # POST /use_case_groups
  # POST /use_case_groups.json
  def create
    @use_case_group = UseCaseGroup.new(params[:use_case_group])

    respond_to do |format|
      if @use_case_group.save
        format.html { redirect_to @use_case_group, notice: 'Use case group was successfully created.' }
        format.json { render json: @use_case_group, status: :created, location: @use_case_group }
      else
        format.html { render action: "new" }
        format.json { render json: @use_case_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /use_case_groups/1
  # PUT /use_case_groups/1.json
  def update
    @use_case_group = UseCaseGroup.find(params[:id])

    respond_to do |format|
      if @use_case_group.update_attributes(params[:use_case_group])
        format.html { redirect_to @use_case_group, notice: 'Use case group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @use_case_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /use_case_groups/1
  # DELETE /use_case_groups/1.json
  def destroy
    @use_case_group = UseCaseGroup.find(params[:id])
    @use_case_group.destroy

    respond_to do |format|
      format.html { redirect_to use_case_groups_url }
      format.json { head :no_content }
    end
  end
end
