class Deck < ApplicationRecord
  has_many :questions, dependent: :destroy
end