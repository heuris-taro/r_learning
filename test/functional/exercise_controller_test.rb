require 'test_helper'

class ExerciseControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end
  test "should get course" do
   get :course
   assert_response :success
  end
end
