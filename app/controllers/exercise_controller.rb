# coding: UTF-8
class ExerciseController < ApplicationController
  skip_before_filter :authorize

  def start

    id = Question.select(:id).sample
    question = Question.find(id)

    redirect_to question
  end
  def course
    @questions = Question.find_all_by_course(params[:course])
  end
end
