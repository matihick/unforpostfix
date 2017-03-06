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
    result = User.where(domain_id: params[:id])

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:email].present?
      result.where!(email: params[:email])
    end

    render json: result
  end

  def aliases
    result = Alias.where(domain_id: params[:id])

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:from].present?
      result.where!(from: params[:from])
    end

    render json: result
  end

  def recipient_bccs
    result = RecipientBcc.where(domain_id: params[:id])

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:from].present?
      result.where!(from: params[:from])
    end

    render json: result
  end

  def sender_bccs
    result = SenderBcc.where(domain_id: params[:id])

    if params[:show_disabled] != 'true'
      result.where!({ enabled: true })
    end

    if params[:from].present?
      result.where!(from: params[:from])
    end

    render json: result
  end
end
