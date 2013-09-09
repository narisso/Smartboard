class TaskUsersController < ApplicationController
  # GET /task_users
  # GET /task_users.json
  def index
    @task_users = TaskUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_users }
    end
  end

  # GET /task_users/1
  # GET /task_users/1.json
  def show
    @task_user = TaskUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_user }
    end
  end

  # GET /task_users/new
  # GET /task_users/new.json
  def new
    @task_user = TaskUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_user }
    end
  end

  # GET /task_users/1/edit
  def edit
    @task_user = TaskUser.find(params[:id])
  end

  # POST /task_users
  # POST /task_users.json
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

  # PUT /task_users/1
  # PUT /task_users/1.json
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

  # DELETE /task_users/1
  # DELETE /task_users/1.json
  def destroy
    @task_user = TaskUser.find(params[:id])
    @task_user.destroy

    respond_to do |format|
      format.html { redirect_to task_users_url }
      format.json { head :no_content }
    end
  end
end
