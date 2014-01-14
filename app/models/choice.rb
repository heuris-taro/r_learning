class Choice < ActiveRecord::Base
  attr_accessible :choice_number, :description, :question_id
  belongs_to :question

  validates :question_id, presence: true
  validates :choice_number, :description, presence: true
  validates :choice_number, numericality: {only_integer: true, greater_than: 0}
end
