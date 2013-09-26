class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json

  def index   
    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.initial_date = Time.now
    
    respond_to do |format|
      if @project.save
<<<<<<< HEAD
        @project.add_user_role(current_user, Role.first)
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
=======
        Status.create({name: 'Backlog', project_id: @project.id})
        Status.create({name: 'In Progress', project_id: @project.id})
        Status.create({name: 'Done', project_id: @project.id})
        @project.add_user_role(current_user, Role.first)
        format.html { redirect_to boards_project_path(@project) }
>>>>>>> 34826f8cdf9a324a2e0b3ab80db2f06d5bad68aa
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def finish
    @project = Project.find(params[:id])
    @project.project_status = ProjectStatus.where(:name => "Finished")
  end
end
