# coding: UTF-8
class ApplicationController < ActionController::Base
  before_filter :authorize

  protect_from_forgery
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "ログインしてください"
    end
  end
  private :authorize
end
