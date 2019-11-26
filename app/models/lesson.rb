class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user
  belongs_to :category
  has_many :words, through: :answers
  has_many :choices, through: :answers

  def next_word
    (category.words - words).first
  end
  def lesson_results
    choices.where(isCorrect: true).count
  end
end
