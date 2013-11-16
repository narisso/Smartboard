# Manages commits's information
class CommitsController < ApplicationController
  
  # Gives the list of commits of the application as JSon
  #
  # @return [String] the list of commits as JSon 
  def index
    @commits = Commit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commits }
    end
  end

  # Gives information about a certain commit
  #
  # @param id [String] the commit id
  # @return [String] the commit's information as JSON
  def show
    @commit = Commit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commit }
    end
  end

  # Gives the template for creating a new commit
  #
  # @return [String] the information to fill about a new commit as a JSON
  def new
    @commit = Commit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commit }
    end
  end

  # Gives the template for edit a comment
  #
  # @param id [String] the commit id
  def edit
    @commit = Commit.find(params[:id])
  end

  # Creates the information for a new commit
  #
  # @param commit [Commit] the information of the new commit from POST
  # @return [String] the status of the creation, and the information of the commit as JSON
  def create
    @commit = Commit.new(params[:commit])

    respond_to do |format|
      if @commit.save
        format.html { redirect_to @commit, notice: 'Commit was successfully created.' }
        format.json { render json: @commit, status: :created, location: @commit }
      else
        format.html { render action: "new" }
        format.json { render json: @commit.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a commit
  #
  # @param id [String] the commit id
  # @param commit [Commit] the information of the commit from POST
  # @return [String] the status of the update, and the information of the commit as JSON
  def update
    @commit = Commit.find(params[:id])

    respond_to do |format|
      if @commit.update_attributes(params[:commit])
        format.html { redirect_to @commit, notice: 'Commit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commit.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a commit of the application
  #
  # @param id [String] the commit id
  # @return [String] the content of the deletion as JSON
  def destroy
    @commit = Commit.find(params[:id])
    @commit.destroy

    respond_to do |format|
      format.html { redirect_to commits_url }
      format.json { head :no_content }
    end
  end
end
