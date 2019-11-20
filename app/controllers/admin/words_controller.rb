class Admin::WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times{@word.choices.build}
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Create new word"
      redirect_to admin_category_words_path
    else
      render "new"
    end
  end
  private
  def word_params
    params.require(:word).permit(:category_id, :content, choices_attributes:[:word_id, :content, :isCorrect])
  end
end
