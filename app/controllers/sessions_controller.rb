#coding: UTF-8
# AdminControllerコントローラクラス
# Author:: ANDO
# Date:: 2014.01.16

# セッションのコントローラクラス
class SessionsController < ApplicationController
  # ApplicationControllerで定義されたauthorizeフィルタを除外するメソッド
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
