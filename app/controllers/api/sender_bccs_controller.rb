class Api::SenderBccsController < Api::BaseApiController
  def show
    render json: SenderBcc.find(params[:id])
  end

  def create
    @sender_bcc = SenderBcc.new({
      domain_id: Domain.enabled.find(params[:domain_id]).id,
      from: params[:from],
      to: params[:to]
    })

    @sender_bcc.save!

    render json: @sender_bcc
  end

  def update
    attrs = {
      from: params[:from],
      to: params[:to],
      enabled: params[:enabled]
    }

    attrs.delete_if { |k,v| v.nil? }

    @sender_bcc = SenderBcc.find(params[:id])
    @sender_bcc.update_attributes!(attrs)

    render json: @sender_bcc
  end

  def destroy
    @sender_bcc = SenderBcc.find(params[:id])
    @sender_bcc.destroy

    render json: { success: true }
  end
end
