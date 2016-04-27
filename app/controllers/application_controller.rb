class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :set_timezone, :check_logged_user

  protected

  def check_if_administrator
    unless current_user.has_role?(:administrator)
      redirect_to root_path
    end
  end

  def check_logged_user
    unless current_user
      redirect_to login_url({
        error: :session_inexistent_or_expired,
        return_url: request.original_url
      })
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def set_locale
    I18n.locale = SETTINGS[:language]
  end

  def set_timezone
    Time.zone = ActiveSupport::TimeZone.zones_map.values.find { |v| v.name == SETTINGS[:timezone] }
  end
end
