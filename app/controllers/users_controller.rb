# Manages user's information
class UsersController < ApplicationController
 
  # Gives the list of users of the application as JSon
  #
  # @return [String] the list of users as JSon 
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # Gives information about a certain user
  #
  # @param id [String] the user id
  # @return [String] the user's information as JSON
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # Gives the template for creating a new user
  #
  # @return [String] the information to fill about a new user as a JSON
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # Gives the template for edit a user
  #
  # @return [String] the information to edit about a user as a JSON
  def edit
    @user = User.find(params[:id])
  end

  # Creates the information for a new user
  #
  # @param user [User] the information of the new user from POST
  # @return [String] the status of the creation, and the information of the user as JSON
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of an user
  #
  # @param id [String] the user id
  # @param user [User] the information of the user from POST
  # @return [String] the status of the update, and the information of the user as JSON
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a user of the application
  #
  # @param id [String] the user id
  # @return [String] the content of the deletion as JSON
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # Gives the unseen notifications of a certain user
  #
  # @return [String] the list of notifications as JSON
  def notifications
    id = current_user.id
    @notifications = Notification.where("user_id = ? AND viewed = ?", id, false)
      respond_to do |format|
        format.html { render :layout => false } # notification.html.erb
        format.json { render json: @notifications }
      end
  end

  # Gives the information of a certain notification, and set it as seen
  #
  # @param notification_id [String] the notification id
  # @return [String] the content of the notification as JSON
  def notification
    @notification = Notification.find(params[:notification_id])
    @notification.viewed = true
      respond_to do |format|
        if @notification.save
          format.html { redirect_to @notification.link, :params => {:task_highlight => @notification.task_id} } # notification.html.erb
          format.json { render json: @notification }
        else
          format.html { redirect_to @notification.link } # notification.html.erb
          format.json { render json: @notification }
        end
      end
  end
end
