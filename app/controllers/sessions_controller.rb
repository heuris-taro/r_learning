#coding: UTF-8
class SessionsController < ApplicationController
  # アクセス制限の解除
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    # ユーザ認証がＯＫの場合
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
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
