# Manages label's information
class LabelsController < ApplicationController
  # Gives the list of labels of the application as JSon
  #
  # @return [String] the list of labels as JSon 
  def index
    @labels = Label.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @labels }
    end
  end

  # Gives information about a certain label
  #
  # @param id [String] the label id
  # @return [String] the label's information as JSON
  def show
    @label = Label.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @label }
    end
  end

  # Gives the template for creating a new label
  #
  # @return [String] the information to fill about a new label as a JSON
  def new
    @label = Label.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @label }
    end
  end

  # Gives the template for edit a label
  #
  # @param id [String] the label id
  def edit
    @label = Label.find(params[:id])
  end

  # Creates the information for a new label
  #
  # @param label [Label] the information of the new label from POST
  # @return [String] the status of the creation, and the information of the label as JSON
  def create
    @label = Label.new(params[:label])

    respond_to do |format|
      if @label.save
        format.html { redirect_to @label, notice: 'Label was successfully created.' }
        format.json { render json: @label, status: :created, location: @label }
      else
        format.html { render action: "new" }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a label
  #
  # @param id [String] the label id
  # @param label [Label] the information of the label from POST
  # @return [String] the status of the update, and the information of the label as JSON
  def update
    @label = Label.find(params[:id])

    respond_to do |format|
      if @label.update_attributes(params[:label])
        format.html { redirect_to @label, notice: 'Label was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a label of the application
  #
  # @param id [String] the label id
  # @return [String] the content of the deletion as JSON
  def destroy
    @label = Label.find(params[:id])
    @label.destroy

    respond_to do |format|
      format.html { redirect_to labels_url }
      format.json { head :no_content }
    end
  end
end
