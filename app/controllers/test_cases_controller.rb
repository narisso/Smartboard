# Manages Test Case's information
class TestCasesController < ApplicationController
  # Gives the list of test cases as JSon
  #
  # @return [String] the list of test cases as JSon 
  def index
    @test_cases = TestCase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_cases }
    end
  end

  # Gives information about a certain test case
  #
  # @param id [String] the test case's id
  # @return [String] the test case's information as JSON
  def show
    @test_case = TestCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_case }
    end
  end

  # Gives the template for creating a new test case
  #
  # @return [String] the information to fill about a new test case as a JSON
  def new
    @test_case = TestCase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_case }
    end
  end

  # Gives the template for edit a test case
  #
  # @param id [String] the test case's id
  def edit
    @test_case = TestCase.find(params[:id])
  end

  # Creates the information for a new test case
  #
  # @param test case [TestCase] the information of the new test case from POST
  # @return [String] the status of the creation, and the information of the test case as JSON
  def create
    @test_case = TestCase.new(params[:test_case])

    respond_to do |format|
      if @test_case.save
        format.html { redirect_to @test_case, notice: 'Test case was successfully created.' }
        format.json { render json: @test_case, status: :created, location: @test_case }
      else
        format.html { render action: "new" }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a test case
  #
  # @param id [String] the test case's id
  # @param test case [TestCase] the information of the test case from POST
  # @return [String] the status of the update, and the information of the test case as JSON
  def update
    @test_case = TestCase.find(params[:id])

    respond_to do |format|
      if @test_case.update_attributes(params[:test_case])
        format.html { redirect_to @test_case, notice: 'Test case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a test case of the application
  #
  # @param id [String] the test case's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @test_case = TestCase.find(params[:id])
    @test_case.destroy

    respond_to do |format|
      format.html { redirect_to test_cases_url }
      format.json { head :no_content }
    end
  end
end
