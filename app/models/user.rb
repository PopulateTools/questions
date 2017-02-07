class User < ApplicationRecord
  has_secure_password validations: false

  has_many :answers

  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase.strip }

   def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = self.class.new_token
    update_attribute(:remember_digest, User.encrypt(remember_token))
  end

  def authenticated?(remember_token)
    remember_digest == User.encrypt(remember_token)
  end

  def api_token
    @api_token ||= [Base64.strict_encode64(email), Base64.strict_encode64(remember_token)].join('.')
  end
end
