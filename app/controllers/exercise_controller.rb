# coding: UTF-8
class ExerciseController < ApplicationController
  # アクセス制限の解除
  skip_before_filter :authorize

  def start
    ids=Question.select(:id).shuffle
    @question = Question.find(ids[0])

    respond_to do |format|
      format.html { redirect_to @question}
    end
  end
end
