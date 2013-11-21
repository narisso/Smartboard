# Manages the information of the task of a user
class TaskUsersController < ApplicationController
 
  # Gives the list of tasks of associated to a user, as JSON
  #
  # @return [String] the list of tasks associated to a user as JSon 
  def index
    @task_users = TaskUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_users }
    end
  end

  # Gives information about a certain task of a user
  #
  # @param id [String] the taskUser's id
  # @return [String] the task's information as JSON
  def show
    @task_user = TaskUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_user }
    end
  end

  # Gives the template for creating a new task of a user
  #
  # @return [String] the information to fill about a new task of a user as a JSON
  def new
    @task_user = TaskUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_user }
    end
  end

  # Gives the template to edit the information of a user's task
  #
  # @param id [String] the task's id
  def edit
    @task_user = TaskUser.find(params[:id])
  end

  # Creates the information for a new task of a user
  # 
  # @param task_user [TaskUser] the task's information
  # @return [String] the status of the creation, and the information of the task as JSON
  def create
    @task_user = TaskUser.new(params[:task_user])

    respond_to do |format|
      if @task_user.save
        format.html { redirect_to @task_user, notice: 'Task user was successfully created.' }
        format.json { render json: @task_user, status: :created, location: @task_user }
      else
        format.html { render action: "new" }
        format.json { render json: @task_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a task
  #
  # @param id [String] the id of the task of a user
  # @param task_user [TaskUser] the information of the task from POST
  # @return [String] the status of the update, and the information of the task as JSON
  def update
    @task_user = TaskUser.find(params[:id])

    respond_to do |format|
      if @task_user.update_attributes(params[:task_user])
        format.html { redirect_to @task_user, notice: 'Task user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a task from a user from the BD
  #
  # @param id [String] the task's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @task_user = TaskUser.find(params[:id])
    @task_user.destroy

    respond_to do |format|
      format.html { redirect_to task_users_url }
      format.json { head :no_content }
    end
  end
end
