class ExerciseController < ApplicationController
  def start
    ids=Question.select(:id).shuffle
    @question = Question.find(ids[0])

    respond_to do |format|
      format.html { redirect_to @question}
    end
  end
end
