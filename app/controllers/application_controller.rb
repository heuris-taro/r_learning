# coding: UTF-8
class ApplicationController < ActionController::Base
  before_filter :authorize
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "ログインしてください"
    end
  end
  
  # 解答するボタンをクリックすると呼び出されるメソッド
  # 試行回数、正解回数、到達回数をカウントする
  def count
    # 更新対象となるユーザのレコードを取得する
    @user = User.find(session[:user_id])

    # 試行回数をカウントする
    @trial_cnt = User.find(session[:user_id], select: "trial_cnt")
    trial = @trial_cnt.trial_cnt + 1
    @user.update_attribute(:trial_cnt, trial)
    # 正解回数をカウントする
    @answer_cnt = User.find(session[:user_id], select: "answer_cnt")
    if @mistake.nil?
      answer = @answer_cnt.answer_cnt + 1
      @user.update_attribute(:answer_cnt, answer)
    end
  end

  # 次回から表示しないをクリックすると呼び出されるメソッド
  def arrival
    # 現在の到達回数をカウントする
    @arrival_cnt  = User.find(session[:user_id], select: "arrival_cnt")
    if @arrival_cnt == '1'
      arrival = @arrival_cnt.arrival_cnt + 1
      @user.update_attribute(:arrival_cnt, arrival)
    end
  end
end
