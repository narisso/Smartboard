class TasksController < ApplicationController

  def show_comments_of_task
    @task = Task.find(params[:id])
    @comments = @task.comments

    respond_to do |format|
      format.html {
        if request.xhr?

        else

        end
      }
      format.js{

      }
    end

  end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.js # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @task.project = Project.find(params[:project_id])
    @task.status = Status.find(params[:status_id])
    @editing = false

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @editing = true
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.task_type = @task.label.name
    #@task.project = Project.find(params[:project_id])
    #@task.status = Project.find(params[:status_id])

    respond_to do |format|
      if @task.save
        format.js { render :js => "window.location = '#{boards_project_path(@task.project_id)}'" }
        format.html { redirect_to boards_project_path(@task.project_id)}#, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.js { redirect_to new_project_status_task_path, alert: 'Name must not be blank'}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    @task.task_type = @task.label.name

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.js { render :js => "window.location = '#{boards_project_path(@task.project_id)}'" }
        format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        format.js { redirect_to new_project_status_task_path, alert: 'Name must not be blank'}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to boards_project_path(params[:project_id]) }
      format.json { head :no_content }
    end
  end



  # GET /tasks/project_tasks/1
  # GET /tasks/project_tasks/1.json
  def project_tasks

    @tasks=Task.where(:project_id => params[:id])


    respond_to do |format|
      format.html # project_tasks.html.erb
      format.json { render json: @tasks.to_json(:include => [:users, :label]) }
    end
  end

  def new_reported_hours
    @rh = ReportedHours.new
    @task = Task.find(params[:task_id])
    @rh.task = @task
    @rh.user = current_user

  end

  def create_reported_hours
    @rh = ReportedHours.find_by_user_id_and_task_id(params[:user_id],params[:task_id])
    @task = Task.find(params[:task_id])
      
    if @rh
      @rh.reporting_hours = params[:rh][:reporting_hours]
    else
      @rh = ReportedHours.new(params[:rh])
      @rh.task = @task
      @rh.user = current_user
    end

    @rh.save

    redirect_to boards_project_path(@task.status.project)
  end

  #def reported_hours_index

  #end



end




