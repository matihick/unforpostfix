class SenderAccessesController < ApplicationController
  before_action :check_if_administrator

  def index
    @sender_accesses = SenderAccess.all
  end

  def show
    @sender_access = SenderAccess.find(params[:id])
  end

  def new
    @sender_access = SenderAccess.new({
      enabled: true,
      status: 'reject'
    })

    @statuses = [[I18n.t('access_status.reject'), 'reject'], [I18n.t('access_status.ok'), 'ok']]
  end

  def create
    @sender_access = SenderAccess.new(permitted_params)
    @sender_access.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @sender_access, target_path: sender_accesses_path
        }
      end
    end
  end

  def edit
    @sender_access = SenderAccess.find(params[:id])

    @statuses = [[I18n.t('access_status.reject'), 'reject'], [I18n.t('access_status.ok'), 'ok']]
  end

  def update
    @sender_access = SenderAccess.find(params[:id])
    @sender_access.update_attributes(permitted_params)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @sender_access, target_path: sender_accesses_path
        }
      end
    end
  end

  def destroy
    @sender_access = SenderAccess.find(params[:id])
    @sender_access.destroy

    redirect_to sender_accesses_path
  end

  protected

  def permitted_params
    params[:sender_access].permit(:name, :status, :reject_note, :observations, :enabled)
  end
end
