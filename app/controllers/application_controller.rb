class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :set_timezone

  protected

  def set_locale
    I18n.locale = SETTINGS[:language]
  end

  def set_timezone
    Time.zone = ActiveSupport::TimeZone.zones_map.values.find { |v| v.name == SETTINGS[:timezone] }
  end
end
