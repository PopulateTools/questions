class User < ApplicationRecord
  has_many :answers

  def to_token_payload
    {
      sub: id,
      email: email
    }
  end
end
