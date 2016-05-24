class Api::BaseApiController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :restrict_access

  protected

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @api_client = ApiClient.enabled.where(access_token: token).first
      @api_client.present?
    end
  end

  def default_serializer_options
    { root: false }
  end
end
