# coding: UTF-8
class QuestionsController < ApplicationController
  skip_before_filter :authorize, only: [:show, :explain]
  skip_before_filter :management_screen, only: [:new, :edit, :create, :update, :destroy]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.find_all_by_user_id(session[:user_id])

    if session[:user_id]
	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @questions }
	    end
	  else
	  	redirect to login_url,
	  	notice: "ログインしてください"
	  end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    if @question.choices.empty?
      redirect_to questions_url,
        notice: "選択肢が0個です"
      return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])

  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    @question.user_id = session[:user_id]
    choice = Choice.new( choice_number: 1,
                        description: '選択肢の内容')

    respond_to do |format|
      if @question.save
        choice.question_id = @question.id
        choice.save
        format.html { redirect_to edit_question_url(@question),
                      notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])
    #p 'DEBUG', 
    @question.course = params[:course]
    respond_to do |format|
			if @question.user_id == session[:user_id] || User.find(session[:user_id]).authority == 1
	      if @question.update_attributes(params[:question])
	        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @question.errors, status: :unprocessable_entity }
	      end
	    else
	    	format.html { redirect_to questions_url, notice: 'You do not have permission to edit.' }
	      format.json { render json: @question.errors, status: :unprocessable_entity }
	    end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    if @question.user_id == session[:user_id] || session[:authority] == 1
	    respond_to do |format|
	      format.html { redirect_to questions_url }
	      format.json { head :no_content }
	    end
	  end
  end

  # GET /questions/1/explain
  def explain
    @question = Question.find(params[:id])
    if @question.single?
      choiced_ans = Set.new([ params[:choice].to_i ])
    else
      choiced_ans = params[:choice].
        each_with_object(Set.new) do |(k, v), a|
        a << k.to_i if v == '1'
      end
    end
    @corrects = Set.new( @question.correct_answers.map(&:choice_number) )
    @mistake = nil
    unless @corrects == choiced_ans
      @mistake = choiced_ans
    end
    
    # 各カウント処理を実行
    # 到達度のカウント。arrival表にレコードを追加
    @question_id = Question.find(params[:id])
    question_id = @question_id.id
    @user_id = User.find(session[:user_id])
    user_id = @user_id.id

    an_arrival = Arrival.new(
      user_id: user_id,
      question_id: question_id,
      arrival_flg: false )
    an_arrival.save
    @arrival = Arrival.where('user_id = ? AND question_id = ?', user_id, question_id).first
    if @mistake.nil?
      @arrival.update_attribute(:arrival_flg, true)
    else
      @arrival.update_attribute(:arrival_flg, false)
    end
    # 正解数、試行回数のカウント
    count()
  end
end
