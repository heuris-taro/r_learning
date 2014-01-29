#coding: UTF-8
class AdminController < ApplicationController

  
  def index
    @user = User.find(session[:user_id])
    # 現在の登録問題数を取得する
    @total_questions = Question.count
    @questions = Question.all
    
    # 現在の試行回数を取得する
    @trial_cnt = User.find(session[:user_id], select: "trial_cnt")
    # 現在の正解回数を取得する
    @answer_cnt = User.find(session[:user_id], select: "answer_cnt")
    # 現在の到達回数を取得する
    @user_id = User.find(session[:user_id])
    user_id = @user_id.id
    @arrival_cnt = Arrival.where('user_id = ? AND arrival_flg = ?', user_id, 't').count

    # 問題管理画面へリダイレクトする
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end
end
