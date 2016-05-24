class Api::DomainsController < Api::BaseApiController
  def index
    result = Domain.all

    unless params[:show_disabled] == 'true'
      result.where!({ enabled: true })
    end

    render json: result
  end

  def show
    render json: Domain.find(params[:id])
  end

  def users
    result = Domain.find(params[:id]).users

    unless params[:show_disabled] == 'true'
      result.where!({ enabled: true })
    end

    render json: result
  end

  def aliases
    result = Domain.find(params[:id]).aliases

    unless params[:show_disabled] == 'true'
      result.where!({ enabled: true })
    end

    render json: result
  end

  def recipient_bccs
    result = Domain.find(params[:id]).recipient_bccs

    unless params[:show_disabled] == 'true'
      result.where!({ enabled: true })
    end

    render json: result
  end

  def sender_bccs
    result = Domain.find(params[:id]).sender_bccs

    unless params[:show_disabled] == 'true'
      result.where!({ enabled: true })
    end

    render json: result
  end
end
