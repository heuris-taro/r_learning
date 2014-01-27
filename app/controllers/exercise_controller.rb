# coding: UTF-8
class ExerciseController < ApplicationController
  skip_before_filter :authorize

  def start
    ids = Question.select(:id).shuffle # for Task Queue
    @question = Question.find(ids[0])

    respond_to do |format|
      format.html { redirect_to @question}
    end
  end
end
