class Word < ApplicationRecord
  belongs_to :category
  has_many :choices ,dependent: :destroy
  accepts_nested_attributes_for :choices
  validates :content, presence: true
  validate :count_choices
  validate :unique_choice
  
  def count_choices
    count = choices.collect { |choice| choice.isCorrect }.count(true)
    if (count == 0)
      errors.add(:choice, "You should check at lease one box")
    elsif(count > 1)
      errors.add(:choice, "You should check at most one box")
    end
  end

  def unique_choice
    count = choices.uniq{ |choice| choice.content}.length
    if (count < choices.length)
      errors.add(:choice, "You should have unique choices")
    end
  end
  
  def correct_answer
    choices.find_by(isCorrect:true).try(:content)
  end
end
