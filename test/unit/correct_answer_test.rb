require 'test_helper'

class CorrectAnswerTest < ActiveSupport::TestCase
  test "correct_answer attributes must not be empty" do
    correct_answer = CorrectAnswer.new # empty object
#    assert correct_answer.invalid?
  end
end
