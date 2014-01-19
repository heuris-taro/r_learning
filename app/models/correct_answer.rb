# encoding: utf-8
class CorrectAnswer < ActiveRecord::Base
  attr_accessible :choice_number, :question_id
  belongs_to :question

  validates :question, presence: {message: 'does not exist'}
  validates :choice_number, presence: true
  validates :choice_number, numericality: {only_integer: true, greater_than: 0}
  validates :choice_number, uniqueness: {scope: :question_id}
  validates_each :choice_number do |record, attr, value|
    unless (1 .. record.question.choices.count) === value
      record.errors.add(attr, "must be member of the choices")
    end
  end
end
