class TasksController < ApplicationController

 load_and_authorize_resource :project, :except => [:update_status]
 load_and_authorize_resource :status, :through => :project, :except => [:update_status, :change_lock]
 load_and_authorize_resource :task, :through => :status, :except => [:update_status, :change_lock]

 skip_authorize_resource :only => [:create_reported_hours]



 respond_to :html, :json

  def show_comments_of_task
    @task = Task.find(params[:id])
    @comments = @task.comments

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /tasks
  # GET /tasks.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @project = Project.find(params[:project_id])
    @status = Status.find(params[:status_id])
    @task = Task.find(params[:id])
    @comment = Comment.new
    @comment.task = @task
    @comment.user = current_user
    @subtask = SubTask.new
    respond_to do |format|
      format.js # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
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
    @task.project = Project.find(params[:project_id])
    @task.status = Status.find(params[:status_id])

    respond_to do |format|
      if @task.save
            @task.users.each do |user|
              @notification = Notification.new
              @notification.user = user
              @notification.link = boards_project_path(@task.project_id)
              @notification.description = "You were assigned to a new task"
              @notification.viewed = false
              @notification.task_id = @task.id
              @notification.save
          end
        format.js { render :js => "window.location = '#{boards_project_path(@task.project_id)}'" }
        format.html { redirect_to boards_project_path(@task.project_id)}#, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.js { redirect_to new_project_status_task_path, alert: 'Error'}
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
        format.js { redirect_to edit_project_status_task_path, alert: 'Name must not be blank'}
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
    @tasks = @project.tasks


    respond_to do |format|
      format.html # project_tasks.html.erb
      format.json { render json: @tasks.to_json(:include => [:users, :label]) }
    end
  end

  def new_reported_hours
    @rh = ReportedHours.new
    @rh.task = @task
    @rh.user = current_user

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_reported_hours
    @rh = ReportedHours.find_by_user_id_and_task_id(params[:user_id],params[:id])
    @status = Status.find(params[:status_id])
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
      
    if @rh
      @rh.update_attributes(params[:rh])
    else
      @rh = ReportedHours.new(params[:rh])
      @rh.task = @task
      @rh.user = current_user
      @rh.save
    end


    redirect_to boards_project_path(@project)
  end

  def create_subtask
    @status = Status.find(params[:status_id])
    @project = Project.find(params[:project_id])
    @subtask = SubTask.new(params[:subtask])
    @task = Task.find(params[:task_id])
    @subtask.task = @task
    @subtask.save
   # redirect_to boards_project_path(@project)
  end

  def new_subtask
    @status = Status.find(params[:status_id])
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @subtask = SubTask.new
  end

  def delete_subtask
    @status = Status.find(params[:status_id])
    @subtask=SubTask.find(params[:sub_task_id])
    @subtask.destroy
  end

  def update_subtask
    @status = Status.find(params[:status_id])    
    @project = Project.find(params[:project_id])
    @subtask = SubTask.find(params[:sub_task_id])
    @subtask.update_attributes(params[:sub_task])

    respond_with @subtask

    
  end

  #def reported_hours_index

  #end

  def update_status

    @task = Task.find(params[:task_id])
    @project = Project.find(params[:id])
    @status = Status.find(params[:col])

    @task.status = @status
    
    respond_to do |format|
      if @task.save
        format.js { render :js => "" }
        format.json { head :no_content }
      else
        format.js { render :js => "alert('error')" }
        format.json { head :no_content }
      end
    end

  end

  def change_lock

     @task = Task.find(params[:id])
     if(not @task.lock == nil )
       @task.lock = !@task.lock
     else
       @task.lock = true
     end 
     @task.save
     redirect_to boards_project_path(@project)
  end 


end




