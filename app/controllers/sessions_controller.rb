#coding: UTF-8
class SessionsController < ApplicationController
  # アクセス制限の解除
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    @authority = nil
    # ユーザ認証がＯＫの場合
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
			flash[:authority] = user.authority
      if user.authority == 1
      	redirect_to users_url
      else
      	redirect_to admin_url
      end
    # ユーザ認証がＮＧの場合
    else
      redirect_to login_url, alert: "無効なユーザ／パスワードの組み合わせです。"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_url, notice: "ログアウト"
  end
end
