class RecipientAccessesController < ApplicationController
  before_action :check_if_administrator

  def index
    @recipient_accesses = RecipientAccess.all
  end

  def show
    @recipient_access = RecipientAccess.find(params[:id])
  end

  def new
    @recipient_access = RecipientAccess.new({
      enabled: true,
      status: 'reject'
    })

    @statuses = [[I18n.t('access_status.reject'), 'reject'], [I18n.t('access_status.ok'), 'ok']]
  end

  def create
    @recipient_access = RecipientAccess.new(permitted_params)
    @recipient_access.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @recipient_access, target_path: recipient_accesses_path
        }
      end
    end
  end

  def edit
    @recipient_access = RecipientAccess.find(params[:id])

    @statuses = [[I18n.t('access_status.reject'), 'reject'], [I18n.t('access_status.ok'), 'ok']]
  end

  def update
    @recipient_access = RecipientAccess.find(params[:id])
    @recipient_access.update_attributes(permitted_params)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @recipient_access, target_path: recipient_accesses_path
        }
      end
    end
  end

  def destroy
    @recipient_access = RecipientAccess.find(params[:id])
    @recipient_access.destroy

    redirect_to recipient_accesses_path
  end

  protected

  def permitted_params
    params[:recipient_access].permit(:name, :status, :reject_note, :observations, :enabled)
  end
end
