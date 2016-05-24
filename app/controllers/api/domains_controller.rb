class Api::DomainsController < Api::BaseApiController
  def index
    render json: Domain.all
  end

  def users
    render json: Domain.find(params[:id]).users
  end

  def aliases
    render json: Domain.find(params[:id]).aliases
  end

  def recipient_bccs
    render json: Domain.find(params[:id]).recipient_bccs
  end

  def sender_bccs
    render json: Domain.find(params[:id]).sender_bccs
  end
end
