class RecipientBccsController < ApplicationController
  before_action :load_domain

  def new
    @recipient_bcc = @domain.recipient_bccs.build(enabled: true)
    @form_object = [@domain, @recipient_bcc]
  end

  def create
    @recipient_bcc = @domain.recipient_bccs.build(permitted_params)
    @recipient_bcc.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @recipient_bcc, target_path: domain_path(@domain, anchor: 'recipient_bccs')
        }
      end
    end
  end

  def edit
    @form_object = @recipient_bcc
  end

  def update
    @recipient_bcc.update_attributes(permitted_params)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @recipient_bcc, target_path: domain_path(@domain, anchor: 'recipient_bccs')
        }
      end
    end
  end

  def destroy
    @recipient_bcc.destroy

    redirect_to domain_path(@domain, anchor: 'recipient_bccs')
  end

  protected

  def permitted_params
    params[:recipient_bcc].permit(:from, :to, :enabled)
  end

  def load_domain
    if params[:domain_id].present?
      @domain = Domain.find(params[:domain_id])
    else
      @recipient_bcc = RecipientBcc.find(params[:id])
      @domain = @recipient_bcc.domain
    end
  end
end
