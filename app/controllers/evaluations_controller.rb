# Manages evaluation's information
class EvaluationsController < ApplicationController
  # Gives the list of evaluations of the application as JSon
  #
  # @return [String] the list of bugs as JSon 
  def index
    @evaluations = Evaluation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluations }
    end
  end

  # Gives information about a certain evaluation
  #
  # @param id [String] the evaluation's id
  # @return [String] the bug's information as JSON
  def show
    @evaluation = Evaluation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluation }
    end
  end

  # Gives the template for creating a new evaluation
  #
  # @return [String] the information to fill about a new evaluation as a JSON
  def new
    @evaluation = Evaluation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluation }
    end
  end

  # Gives the template for edit a evaluation
  #
  # @param id [String] the evaluation's id
  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  # Creates the information for a new evaluation
  #
  # @param evaluation [Evaluation] the information of the new evaluation from POST
  # @return [String] the status of the creation, and the information of the evaluation as JSON
  def create
    @evaluation = Evaluation.new(params[:evaluation])

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render json: @evaluation, status: :created, location: @evaluation }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a evaluation
  #
  # @param id [String] the evaluation's id
  # @param evaluation [Evaluation] the information of the evaluation from POST
  # @return [String] the status of the update, and the information of the evaluation as JSON
  def update
    @evaluation = Evaluation.find(params[:id])

    respond_to do |format|
      if @evaluation.update_attributes(params[:evaluation])
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a evaluation of the application
  #
  # @param id [String] the evaluation's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy

    respond_to do |format|
      format.html { redirect_to evaluations_url }
      format.json { head :no_content }
    end
  end
end
