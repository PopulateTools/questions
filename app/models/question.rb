class Question < ApplicationRecord
  belongs_to :deck
  has_many :options
  has_many :answers

  def self.pending_for_user( user)
    answered_questions_ids = user.answers.pluck(:question_id)
    if id = (all.pluck(:id) - answered_questions_ids).sample
      Question.find(id)
    else
      nil
    end
  end

  def stats
    total_answers = answers.count.to_f
    options.map do |option|
      total = option.answers.count.to_f
      if total > 0
        percentage = ((total / total_answers)*100).round(1)
      else
        percentage = 0
      end

      {
        id: option.id,
        value: option.value,
        percentage: percentage
      }
    end
  end
end
