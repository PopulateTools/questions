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
end
