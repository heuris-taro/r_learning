require 'test_helper'

class ChoiceTest < ActiveSupport::TestCase
  test "choice attributes must not be empty" do
    choice = Choice.new # empty object
    assert choice.invalid?
    assert choice.errors[:question_id].any?
    assert choice.errors[:choice_number].any?
    assert choice.errors[:description].any?
  end
  test "choice_number must be natural number" do
    choice = choices(:one)

    choice.choice_number = 0
    assert choice.invalid?
    assert_equal "must be greater than 0",
    choice.errors[:choice_number].join('; ')

    choice.choice_number = 0.5
    assert choice.invalid?
    assert_equal "must be an integer",
    choice.errors[:choice_number].join('; ')

    choice.choice_number = 1
    assert choice.valid?
  end
  test "pair of choice_number and question_id must be unique" do
    choice = Choice.new(choice_number: choices(:one).choice_number,
		       question_id: choices(:one).question_id)
    assert ! choice.save
    assert_equal "has already been taken",
      choice.errors[:choice_number].join('; ')
  end

  test "explanation can be empty" do
    choice = choices(:one)
    choice.explanation = nil
    assert choice.valid?
  end
end
