class User < ApplicationRecord
  has_secure_password validations: false

  has_many :answers

  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase.strip }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = self.class.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end


  def to_token_payload
    {
      sub: id,
      email: email
    }
  end
end
