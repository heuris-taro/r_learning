require 'test_helper'

class CorrectAnswersControllerTest < ActionController::TestCase
  setup do
    @correct_answer = correct_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:correct_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create correct_answer" do
    assert_difference('CorrectAnswer.count') do
      post :create, correct_answer: { choice_number: @correct_answer.choice_number, question_id: @correct_answer.question_id }
    end

    assert_redirected_to correct_answer_path(assigns(:correct_answer))
  end

  test "should show correct_answer" do
    get :show, id: @correct_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @correct_answer
    assert_response :success
  end

  test "should update correct_answer" do
    put :update, id: @correct_answer, correct_answer: { choice_number: @correct_answer.choice_number, question_id: @correct_answer.question_id }
    assert_redirected_to correct_answer_path(assigns(:correct_answer))
  end

  test "should destroy correct_answer" do
    assert_difference('CorrectAnswer.count', -1) do
      delete :destroy, id: @correct_answer
    end

    assert_redirected_to correct_answers_path
  end
end
