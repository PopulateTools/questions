class Api::ApplicationController < ApplicationController
  before_action :authenticate_api_user

  private

  def authenticate_api_user
    if request.headers['authorization'].present?
      authorization_token = request.headers['authorization'].split(' ').try(:last)
      email, token = authorization_token.split('.')
      email = Base64.strict_decode64(email)
      token = Base64.strict_decode64(token)
      user = User.find_by_email!(email)
      return user.authenticated?(token)
    else
      head :unauthorized
    end
  end
end
