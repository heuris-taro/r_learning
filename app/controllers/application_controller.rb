# coding: UTF-8
class ApplicationController < ActionController::Base
  before_filter :authorize
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "ログインしてください"
    end
  end
  
end
