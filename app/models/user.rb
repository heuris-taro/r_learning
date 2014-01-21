class User < ActiveRecord::Base
  # 同じ名前のユーザがデータベースに2人いないかを検証する
  validates :name, presence: true, uniqueness: true
  # タイプしたパスワードに誤りがないかを検証する
  has_secure_password
  attr_accessible :name, :password_digest, :password, :password_confirmation
end
