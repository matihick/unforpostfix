class ClientAccessesController < ApplicationController
  def index
    @client_accesses = ClientAccess.all
  end

  def show
    @client_access = ClientAccess.find(params[:id])
  end

  def new
    @client_access = ClientAccess.new({
      enabled: true,
      status: 'reject'
    })

    @statuses = [[I18n.t('access_status.reject'), 'reject'], [I18n.t('access_status.ok'), 'ok']]
  end

  def create
    @client_access = ClientAccess.new(permitted_params)
    @client_access.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @client_access, target_path: client_accesses_path
        }
      end
    end
  end

  def edit
    @client_access = ClientAccess.find(params[:id])

    @statuses = [[I18n.t('access_status.reject'), 'reject'], [I18n.t('access_status.ok'), 'ok']]
  end

  def update
    @client_access = ClientAccess.find(params[:id])
    @client_access.update_attributes(permitted_params)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @client_access, target_path: client_accesses_path
        }
      end
    end
  end

  def destroy
    @client_access = ClientAccess.find(params[:id])
    @client_access.destroy

    redirect_to client_accesses_path
  end

  protected

  def permitted_params
    params[:client_access].permit(:name, :status, :reject_note, :observations, :enabled)
  end
end
