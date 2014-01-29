class Arrival < ActiveRecord::Base
  attr_accessible :arrival_flg, :question_id, :user_id
  belongs_to :question		# questions表を親とする
  belongs_to :user				# users表を親とする
end
