class CorrectAnswersController < ApplicationController
  # GET /correct_answers
  # GET /correct_answers.json
  def index
    @correct_answers = CorrectAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @correct_answers }
    end
  end

  # GET /correct_answers/1
  # GET /correct_answers/1.json
  def show
    @correct_answer = CorrectAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @correct_answer }
    end
  end

  # GET /correct_answers/new
  # GET /correct_answers/new.json
  def new
    @correct_answer = CorrectAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @correct_answer }
    end
  end

  # GET /correct_answers/1/edit
  def edit
    @correct_answer = CorrectAnswer.find(params[:id])
  end

  # POST /correct_answers
  # POST /correct_answers.json
  def create
    @correct_answer = CorrectAnswer.new(params[:correct_answer])

    respond_to do |format|
      if @correct_answer.save
        format.html { redirect_to @correct_answer, notice: 'Correct answer was successfully created.' }
        format.json { render json: @correct_answer, status: :created, location: @correct_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @correct_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /correct_answers/1
  # PUT /correct_answers/1.json
  def update
    @correct_answer = CorrectAnswer.find(params[:id])

    respond_to do |format|
      if @correct_answer.update_attributes(params[:correct_answer])
        format.html { redirect_to @correct_answer, notice: 'Correct answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @correct_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /correct_answers/1
  # DELETE /correct_answers/1.json
  def destroy
    @correct_answer = CorrectAnswer.find(params[:id])
    @correct_answer.destroy

    respond_to do |format|
      format.html { redirect_to correct_answers_url }
      format.json { head :no_content }
    end
  end
end
