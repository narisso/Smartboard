# Manages role's information
class RolesController < ApplicationController
  # Gives the list of roles as JSon
  #
  # @return [String] the list of roles as JSon 
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end

  # Gives information about a certain role
  #
  # @param id [String] the role's id
  # @return [String] the role's information as JSON
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # Gives the template for creating a new role
  #
  # @return [String] the information to fill about a new role as a JSON
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # Gives the template for edit a role
  #
  # @param id [String] the role's id
  def edit
    @role = Role.find(params[:id])
  end

  # Creates the information for a new role
  #
  # @param bug [Bug] the information of the new role from POST
  # @return [String] the status of the creation, and the information of the role as JSON
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a role
  #
  # @param id [String] the role's id
  # @param role [Role] the information of the role from POST
  # @return [String] the status of the update, and the information of the role as JSON
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a role of the application
  #
  # @param id [String] the role's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
end