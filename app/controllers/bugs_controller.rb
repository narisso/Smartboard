# Manages bug's information
class BugsController < ApplicationController
  # Gives the list of bugs as JSon
  #
  # @return [String] the list of bugs as JSon 
  def index
    @bugs = Bug.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bugs }
    end
  end

  # Gives information about a certain bug
  #
  # @param id [String] the bug's id
  # @return [String] the bug's information as JSON
  def show
    @bug = Bug.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bug }
    end
  end

  # Gives the template for creating a new bug
  #
  # @return [String] the information to fill about a new bug as a JSON
  def new
    @bug = Bug.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bug }
    end
  end

  # Gives the template for edit a bug
  #
  # @param id [String] the bug's id
  def edit
    @bug = Bug.find(params[:id])
  end

  # Creates the information for a new bug
  #
  # @param bug [Bug] the information of the new bug from POST
  # @return [String] the status of the creation, and the information of the bug as JSON
  def create
    @bug = Bug.new(params[:bug])

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: 'Bug was successfully created.' }
        format.json { render json: @bug, status: :created, location: @bug }
      else
        format.html { render action: "new" }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a bug
  #
  # @param id [String] the bug's id
  # @param bug [Bug] the information of the bug from POST
  # @return [String] the status of the update, and the information of the bug as JSON
  def update
    @bug = Bug.find(params[:id])

    respond_to do |format|
      if @bug.update_attributes(params[:bug])
        format.html { redirect_to @bug, notice: 'Bug was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a bug of the application and redirects the webpage
  #
  # @param id [String] the bug's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    respond_to do |format|
      format.html { redirect_to bugs_url }
      format.json { head :no_content }
    end
  end
end
