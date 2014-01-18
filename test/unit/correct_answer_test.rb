require 'test_helper'

class CorrectAnswerTest < ActiveSupport::TestCase

  test "correct_answer attributes must not be empty" do
    correct_answer = correct_answers(:one)
    correct_answer.choice_number = nil # question_idはnilにできない、validation時関連付けのため
    assert correct_answer.invalid?
    assert correct_answer.errors[:choice_number].any?
  end
  test "choice_number must be natural number" do
    correct_answer = correct_answers(:one)

    correct_answer.choice_number = 0
    assert correct_answer.invalid?
    # 原子的?
    assert_equal "must be greater than 0; must be member of choices",
    correct_answer.errors[:choice_number].join('; ')

    correct_answer.choice_number = 0.5
    assert correct_answer.invalid?
    assert_equal "must be an integer; must be member of choices",
    correct_answer.errors[:choice_number].join('; ')

    correct_answer.choice_number = 1
    assert correct_answer.valid?
  end
  test "pair of choice_number and question_id must be unique" do
    correct_answer = CorrectAnswer.new(choice_number: correct_answers(:one).choice_number,
		       question_id: correct_answers(:one).question_id)
    assert ! correct_answer.save
    assert_equal "has already been taken",
      correct_answer.errors[:choice_number].join('; ')
  end
  test "choice_number must be member of the choices" do
    correct_answer = correct_answers(:one)
    result = Choice.find_by_question_id_and_choice_number(
      correct_answer.question_id, correct_answer.choice_number)
    assert_not_nil result
  end
end
