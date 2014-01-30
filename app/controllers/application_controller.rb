# coding: UTF-8
class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :management_screen
  
  def management_screen
  	if session[:user_id]
			cur_user = User.find(session[:user_id])
			if cur_user
				@authority = cur_user.authority
			end
=begin
			if cur_user
				@authority = true if cur_user.authority == 1
			end
=end
		end
		p 'DEBUG', @authority #> 1
  end
  
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
    # 現在の到達回数をカウントする
    @arrival_cnt  = Arrival.where('arrival_flg = ?', '1').count
  end
end
