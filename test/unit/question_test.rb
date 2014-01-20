require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "question must be valid" do
    question = questions(:one)
    assert question.valid?
  end
  test "question attributes must not be empty" do
    question = Question.new # empty object
    assert question.invalid?
    assert question.errors[:description].any?
    assert question.errors[:explanation].any?
  end
end
