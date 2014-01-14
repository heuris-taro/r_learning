# encoding: utf-8
class CorrectAnswer < ActiveRecord::Base
  attr_accessible :choice_number, :question_id
  belongs_to :question
  
  validates :question_id, presence: true
  validates :choice_number, presence: true
#  validates :choice_number # (1 .. ca.question.choices.size)に含まれるか
end
