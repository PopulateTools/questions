class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsManagement

  rescue_from ActionController::RoutingError, with: :render_404

  before_action :set_locale
  helper_method :current_user, :logged_in?, :current_user?, :login_path

  private

  def set_locale
    I18n.locale = session[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
  rescue I18n::InvalidLocale
    I18n.locale = I18n.default_locale
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first rescue nil
  end

  def render_404
    render file: "public/404", status: 404, layout: false, handlers: [:erb], formats: [:html]
  end

end
