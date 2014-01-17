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
    #choice = Choice.new()
  end
  test "choice_number and question_id must be unique" do
    #choice = Choice.new()
  end
end
