class SessionsController < ApplicationController
  def create
    if user = User.find_by(email: session_params[:email])
      log_in(user)
    else
      if user = User.create(session_params)
        log_in(user)
      end
    end
    redirect_to :back
  end

  private

  def session_params
    params.permit(:email)
  end
end
