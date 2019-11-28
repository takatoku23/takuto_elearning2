class AnswersController < ApplicationController
  before_action :set_lesson, only: [:new, :create]
  def new
    @answer=Answer.new
    @category=Category.find_by(id: @lesson.category_id)

    if @lesson.next_word.nil?
      @lesson.update(total_score: @lesson.lesson_results)
      redirect_to lesson_url(@lesson)
    end
  end

  def create
    @answer = @lesson.answers.build(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:word_id, :choice_id, :lesson_id)
  end
end
