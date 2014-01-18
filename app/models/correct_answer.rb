# encoding: utf-8
class CorrectAnswer < ActiveRecord::Base
  attr_accessible :choice_number, :question_id
  belongs_to :question

  validates :question_id, presence: true
  validates :choice_number, presence: true
  validates :choice_number, numericality: {only_integer: true, greater_than: 0}

  validate :must_be_member
  def must_be_member
    unless (1 .. self.question.choices.size) === self.choice_number
      errors.add(:base, "must be member of choices")
    end
  end
end
