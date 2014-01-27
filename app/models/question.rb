class Question < ActiveRecord::Base
  attr_accessible :description, :explanation
  has_many :correct_answers, dependent: :destroy
  has_many :choices, dependent: :destroy
  validates :description, :explanation, presence: true

  def single?
    correct_answers.count == 1 ? true : false
  end
end
