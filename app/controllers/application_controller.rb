class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::UnknownFormat, with: :render_404

  include SessionsManagement

  before_action :silent_login

  def render_404
    render file: "public/404", status: 404, layout: false, handlers: [:erb], formats: [:html]
  end

  def helpers
    ActionController::Base.helpers
  end

  private

  def silent_login
    unless logged_in?
      log_in(User.create! email: "#{Time.now.to_i}@example.com")
    end
  end
end
