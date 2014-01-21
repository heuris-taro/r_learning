#coding: UTF-8
# AdminControllerコントローラクラス
# Author:: ANDO
# Date:: 2014.01.16

# 管理者のコントローラクラス
class AdminController < ApplicationController

  def index
#    @total_orders = Order.count
    # 現在の登録問題数を取得する
    @total_questions = Question.count
  end
end
