# coding: UTF-8
class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :management_screen
  
  def management_screen
		if session[:user_id]
			user = User.find(session[:user_id]) 
			authority = user.authority
		else
			authority = 0
		end
    @auth = (params[:authority])
    if @auth == "administrative_privileges" || authority == 1
    	@auth = 1
    else
    	@auth = nil
    end
  end
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "ログインしてください"
    end
  end
  
end
