class Option < ApplicationRecord
  belongs_to :question
  has_many :answers

  default_scope { order(position: :asc) }
end
