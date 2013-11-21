# Manages comment's information
class CommentsController < ApplicationController

  respond_to :html, :json

  # Gives the list of comments of the taks as JSon
  #
  # @param task_id [String] the task id 
  # @return [String] the list of comments as JSon 
  def index
    @task = Task.find(params[:task_id])
    @project = @task.project

    respond_to do |format|
      format.js 
      #format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # Gives information about a certain comment
  #
  # @param id [String] the comment's id
  # @return [String] the comment's information as JSON
  def show
    @comment = Comment.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # Gives the template for creating a new comment
  #
  # @return [String] the information to fill about a new comment as a JSON
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # Gives the template for edit a comment
  #
  # @param id [String] the comment id
  def edit
    @comment = Comment.find(params[:id])
  end

  # Creates the information for a new comment
  #
  # @param comment [Comment] the information of the new comment from POST
  # @param task_id [String] the task id 
  # @return [String] the status of the creation, and the information of the comment as JSON
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

  # Changes the information of a comment
  #
  # @param id [String] the comment's id
  # @param task_id [String] the task id 
  # @param comment [Comment] the information of the comment from POST
  # @return [String] the status of the update, and the information of the comment as JSON
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

  # Deletes a comment of the application
  #
  # @param comment_id [String] the comment's id
  # @param status_id [String] the task's status id 
  # @return [String] the content of the deletion as JSON
  def delete_comment
    @comment=Comment.find(params[:comment_id])
    @comment.destroy
  end

end
