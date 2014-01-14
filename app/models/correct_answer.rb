# encoding: utf-8
class CorrectAnswer < ActiveRecord::Base
  attr_accessible :choice_number, :question_id
  belongs_to :question

  validates :question_id, presence: true
  validates :choice_number, presence: true
  validates :choice_number, numericality: {only_integer: true, greater_than: 0}
end
