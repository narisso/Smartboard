class CommentsController < ApplicationController

  respond_to :html, :json

  # GET /comments
  # GET /comments.json
  def index
    @task = Task.find(params[:task_id])
    @project = @task.project

    respond_to do |format|
      format.js 
      #format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @task = Task.find(params[:task_id])
    @comment.task_id = @task.id
    @comment.approved = true

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
        format.js { redirect_to project_status_task_comments_path }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js { redirect_to project_status_task_comments_path}
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @task = Task.find(params[:task_id])
    @project = @task.project

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js { redirect_to project_status_task_comments_path }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:comment_id])
    @task = Task.find(params[:task_id])
    @project = @task.project
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
      format.js { redirect_to project_status_task_comments_path }
    end
  end

  def delete_comment
    @status = Status.find(params[:status_id])
    @comment=Comment.find(params[:comment_id])
    @comment.destroy
  end

end
