class Api::DomainsController < Api::BaseApiController
  def index
    result = Domain.all

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:name].present?
      result.where!(name: params[:name])
    end

    render json: result
  end

  def show
    render json: Domain.find(params[:id])
  end

  def users
    result = Domain.find(params[:id]).users

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:email].present?
      result.where!(email: params[:email])
    end

    render json: result
  end

  def aliases
    result = Domain.find(params[:id]).aliases

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:from].present?
      result.where!(from: params[:from])
    end

    render json: result
  end

  def recipient_bccs
    result = Domain.find(params[:id]).recipient_bccs

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:from].present?
      result.where!(from: params[:from])
    end

    render json: result
  end

  def sender_bccs
    result = Domain.find(params[:id]).sender_bccs

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:from].present?
      result.where!(from: params[:from])
    end

    render json: result
  end
end
