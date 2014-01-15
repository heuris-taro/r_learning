class ExerciseController < ApplicationController
  def start
    @question = Question.first

    respond_to do |format|
      format.html { redirect_to @question}
    end
  end
end
