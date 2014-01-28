# coding: UTF-8
class User < ActiveRecord::Base
  # 同じ名前のユーザがデータベースに2人いないかを検証する
  validates :name, presence: true, uniqueness: true
  # タイプしたパスワードに誤りがないかを検証する
  has_secure_password
  attr_accessible :name, :password_digest, :password, :password_confirmation, :answer_cnt, :trial_cnt, :arrival_cnt
  
  def ensure_an_admin_remains
    if User.count.zero?
    raise "最後のユーザは削除できません"
    end
  end
  
end
