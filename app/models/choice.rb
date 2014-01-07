class Choice < ActiveRecord::Base
  attr_accessible :choice_number, :description, :question_id
  belongs_to :question
end
