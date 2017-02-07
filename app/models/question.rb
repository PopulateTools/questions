class Question < ApplicationRecord
  belongs_to :deck
  has_many :options
  has_many :answers
end
