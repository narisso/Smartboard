# Manages task's information
class TasksController < ApplicationController

 load_and_authorize_resource :project, :except => [:update_status,:assign_use_case]
 load_and_authorize_resource :status, :through => :project, :except => [:update_status,:assign_use_case, :change_lock]
 load_and_authorize_resource :task, :through => :status, :except => [:update_status,:assign_use_case, :change_lock,:create_reported_hours,:new_reported_hours, :new_subtask, :create_subtask,:update_subtask,:delete_subtask]

 skip_authorize_resource :only => [:create_reported_hours,:new_reported_hours]

 respond_to :html, :json
  
  # Shows all the comments of a task
  def show_comments_of_task
    @task = Task.find(params[:id])
    @comments = @task.comments

    respond_to do |format|
      format.html
      format.js
    end

  end

  # Gives the list of tasks as JSon
  #
  # @return [String] the list of tasks as JSon 
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # Gives information about a certain task, and prepare the task for new comments or subtasks.
  #
  # @param id [String] the task's id
  # @param project_id [String] the project's id
  # @param status_id [String] the status' id
  # @return [String] the task's information as JSON
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

  # Gives the template for creating a new task
  #
  # @return [String] the information to fill about a new task as a JSON
  def new

    @task = Task.new
    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # Gives the template for edit a task
  #
  # @param id [String] the task's id
  def edit
    @task = Task.find(params[:id])
  end

  # Creates the information for a new task, and send the notification to all the users assigned to the task.
  #
  # @param task [Task] the information of the new task from POST
  # @param project_id [String] the project's id
  # @param status_id [String] the status' id
  # @return [String] the status of the creation, and the information of the task as JSON
  def create
    @task = Task.new(params[:task])
    @task.task_type = @task.label.name
    @task.project = Project.find(params[:project_id])
    @status = Status.find(params[:status_id])
    @task.status = @status



    respond_to do |format|
      if @task.save_and_notify boards_project_path(@task.project_id), current_user
        @status.insert_into_task_order(0,@task.id)
        @status.save
        format.js { render :js => "location.reload();" }
        format.html { redirect_to boards_project_path(@task.project_id)}#, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.js { render "new"}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a task
  #
  # @param id [String] the task's id
  # @param task [Task] the information of the task from POST
  # @return [String] the status of the update, and the information of the task as JSON
  def update
    @task = Task.find(params[:id])
    @task.task_type = @task.label.name

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.js { render :js => "window.location = '#{boards_project_path(@task.project_id)}'" }
        format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        format.js { render "edit"}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a task of the application and redirects the webpage
  #
  # @param id [String] the task's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @task = Task.find(params[:id])
    @status = @task.status
    @status.delete_from_task_order(@task.id)
    @status.save
    @task.destroy

    respond_to do |format|
      format.html { redirect_to boards_project_path(params[:project_id]) }
      format.json { head :no_content }
    end
  end



  # Gives the task's information of a project, including their users and the label.
  #
  # @return [String] the task's information
  def project_tasks
    @tasks = @project.tasks


    respond_to do |format|
      format.html # project_tasks.html.erb
      format.json { render json: @tasks.to_json(:include => [:users, :label]) }
    end
  end

  # Returns the template for creating a new instance of the reported hours of a task
  def new_reported_hours
    @task = Task.find(params[:id])
    current_report = ReportedHours.find_by_user_id_and_task_id(current_user.id ,@task.id)
    @current_hours = 0;

    if current_report 
      @current_hours = current_report.reporting_hours
    end

    @rh = ReportedHours.new
    @rh.task = @task
    @rh.user = current_user

    respond_to do |format|
      format.html
      format.js
    end
  end

  # Creates the information for a new instance of reported hours of a task.
  #
  # @param user_id [String] the user's id
  # @param id [String] the task's id
  # @param project_id [String] the project's id
  # @param rh [String] the reported hours to register
  def create_reported_hours
    
    rh = ReportedHours.find_by_user_id_and_task_id(params[:user_id],params[:id])
    @status = Status.find(params[:status_id])
    @project = Project.find(params[:project_id])
    task = Task.find(params[:id])
     
    Task.report_hours(rh, params[:rh],current_user,task)

    redirect_to boards_project_path(@project)
  end

  # Creates the information for a new instance of reported hours of a task.
  #
  # @param status_id [String] the status' id
  # @param project_id [String] the project's id
  # @param subtask [SubTask] the subtask to create
  # @param task_id [String] the task's id of the task that contains the subtask
  def create_subtask
    @status = Status.find(params[:status_id])
    @project = Project.find(params[:project_id])
    @subtask = SubTask.new(params[:subtask])
    @task = Task.find(params[:task_id])
    @subtask.task = @task
    @subtask.save
   # redirect_to boards_project_path(@project)
  end

  # Creates an instance of a new subtask.
  #
  # @param status_id [String] the status' id
  # @param projcet_id [String] the project's id
  # @param task_id [String] the id of the task that contains the subtask 
  def new_subtask
    @status = Status.find(params[:status_id])
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @subtask = SubTask.new
  end

  # Deletes a subtask of the application
  #
  # @param status_id [String] the status' id
  # @param sub_task_id [String] the subtask's id
  def delete_subtask
    @status = Status.find(params[:status_id])
    @subtask=SubTask.find(params[:sub_task_id])
    @subtask.destroy
  end

  # Updates the information of a subtask
  #
  # @param status_id [String] the status' id
  # @param sub_task_id [String] the subtask's id
  # @param project_id [String] the project's id
  def update_subtask
    @status = Status.find(params[:status_id])    
    @project = Project.find(params[:project_id])
    @subtask = SubTask.find(params[:sub_task_id])
    @subtask.update_attributes(params[:sub_task])

    respond_with @subtask   
  end

  # Updates the status of a task
  #
  # @param task_id [String] the task's id
  # @param id [String] the project's id
  # @param col [String] the id of the new status of the task
  # @param index [String] index inside task array
  # @param signature [String] client signature
  def update_status
    @task = Task.find(params[:task_id])
    @old_status_id = @task.status.id
    @project = Project.find(params[:id])
    @old_status = @task.status
    @status = Status.find(params[:col])
    @index = params[:index].to_i
    @signature = params[:signature]
    
    if @old_status.id != @status.id
      @old_status.delete_from_task_order(@task.id)
      @status.insert_into_task_order(@index,@task.id)
      @old_status.save
      @status.save
      @task.status = @status
    else
      @status.insert_into_task_order(@index,@task.id)
      @status.save
    end
    
    respond_to do |format|
      if @task.save
        PrivatePub.publish_to "/#{Rails.env}/projects/#{@project.id}/tasks/move", :move => {:type => "task", :id => @task.id, :col => @status.id, :ocol=> @old_status_id, :index=>@index, :signature=>@signature }.to_json
        format.json { head :no_content }
      else
        format.js { render :js => "alert('Error, please reload')" }
      end
    end

  end

  # Locks if a task is unlocked, unlocks if a task is locked.
  #
  # @param id [String] the task's id
  def change_lock
     task = Task.find(params[:id])
     Task.lock_unlock(task)
     redirect_to boards_project_path(@project)
  end 

  # Assigns use cases to a certain cask.
  #
  # @param task_id [String] the task's id
  # @param use_case [String] the use case's id
  def assign_use_case
    @task = Task.find(params[:task_id])
    @task.use_case_id = params[:use_case]

    respond_to do |format|
      if @task.save
        format.js { render :js => "hola" }
        format.json { head :no_content }
      else
        format.js { render :js => "alert('error')" }
        format.json { head :no_content }
      end
    end
  end

end




