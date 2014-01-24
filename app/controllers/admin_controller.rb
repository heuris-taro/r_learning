#coding: UTF-8
# AdminControllerコントローラクラス

# 管理者のコントローラクラス
class AdminController < ApplicationController

  
  def index
    @user = User.find(session[:user_id])
    
    # 現在の登録問題数を取得する
    @total_questions = Question.count
    @questions = Question.all
    
    # 問題管理画面へリダイレクトする
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end
end
