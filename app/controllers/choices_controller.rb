class ChoicesController < ApplicationController

  # GET /choices
  # GET /choices.json
  def index
    @choices = Choice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @choices }
    end
  end

  # GET /choices/1
  # GET /choices/1.json
  def show
    @choice = Choice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @choice }
    end
  end

  # GET /choices/new
  # GET /choices/new.json
  def new
    @choice = Choice.new
    if question = Question.find(params[:question])
      @choice.question_id = question.id
    end
    edge = @choice.question.choices.maximum(:choice_number)
    edge ||= 0
    @choice.choice_number = edge.succ

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @choice }
    end
  end

  # GET /choices/1/edit
  def edit
    @choice = Choice.find(params[:id])
    if @choice.question.correct_answers.find_by_choice_number(@choice.choice_number)
      @is_correct = true
    end
  end

  # POST /choices
  # POST /choices.json
  def create
    @choice = Choice.new(params[:choice])
    key = { question_id: @choice.question.id,
            choice_number: params[:choice][:choice_number] }
    if params[:is_correct] == '1'
      ca = CorrectAnswer.new(key)
    end
    respond_to do |format|
      if @choice.save
        ca && ca.save
        format.html { redirect_to edit_question_url(@choice.question),
                      notice: 'Choice was successfully created.' }
        format.json { render json: @choice, status: :created, location: @choice }
      else
        format.html { render action: "new" }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /choices/1
  # PUT /choices/1.json
  def update
    @choice = Choice.find(params[:id])

    key = { question_id: @choice.question.id,
            choice_number: params[:choice][:choice_number] }
    ca = CorrectAnswer.where(key).first
    if params[:is_correct] == '1' && ca.blank?
      @correct_answer = CorrectAnswer.create key
    elsif params[:is_correct].nil?  && ca
      ca.destroy
    end

    respond_to do |format|
      if @choice.update_attributes(params[:choice])
        format.html { redirect_to edit_question_url(@choice.question),
                      notice: 'Choice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choices/1
  # DELETE /choices/1.json
  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy

    respond_to do |format|
      format.html {
        redirect_to edit_question_url(@choice.question)}
      format.json { head :no_content }
    end
  end
end
