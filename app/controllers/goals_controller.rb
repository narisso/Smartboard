# Manages goal's information
class GoalsController < ApplicationController
  # Gives the list of goal as JSon
  #
  # @return [String] the list of goals as JSon 
  def index
    @goals = Goal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  # Gives information about a certain goal
  #
  # @param id [String] the goal's id
  # @return [String] the goal's information as JSON
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # Gives the template for creating a new goal
  #
  # @return [String] the information to fill about a new goal as a JSON
  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  # Gives the template for edit a goal
  #
  # @param id [String] the goal's id
  def edit
    @goal = Goal.find(params[:id])
  end

  # Creates the information for a new goal
  #
  # @param goal [Goal] the information of the new goal from POST
  # @return [String] the status of the creation, and the information of the goal as JSON
  def create
    @goal = Goal.new(params[:goal])

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a goal
  #
  # @param id [String] the goal id
  # @param goal [Goal] the information of the goal from POST
  # @return [String] the status of the update, and the information of the goal as JSON
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a goal of the application
  #
  # @param id [String] the goal's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
    end
  end
end
