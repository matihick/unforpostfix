class SenderBccsController < ApplicationController
  before_action :load_domain

  def new
    @sender_bcc = @domain.sender_bccs.build(enabled: true)
    @form_object = [@domain, @sender_bcc]
  end

  def create
    @sender_bcc = @domain.sender_bccs.build(permitted_params)
    @sender_bcc.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @sender_bcc, target_path: domain_path(@domain, anchor: 'sender_bccs')
        }
      end
    end
  end

  def edit
    @form_object = @sender_bcc
  end

  def update
    @sender_bcc.update_attributes(permitted_params)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @sender_bcc, target_path: domain_path(@domain, anchor: 'sender_bccs')
        }
      end
    end
  end

  def destroy
    @sender_bcc.destroy

    redirect_to domain_path(@domain, anchor: 'sender_bccs')
  end

  protected

  def permitted_params
    params[:sender_bcc].permit(:from, :to, :enabled)
  end

  def load_domain
    if params[:domain_id].present?
      @domain = Domain.find(params[:domain_id])
    else
      @sender_bcc = SenderBcc.find(params[:id])
      @domain = @sender_bcc.domain
    end
  end
end
