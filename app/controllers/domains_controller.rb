class DomainsController < ApplicationController
  before_action :check_if_administrator, except: [:index, :show]

  def index
    @domains = Domain.all

    unless current_user.has_role?(:administrator)
      if current_user.domain.workgroup_id.present?
        @domains.where!({workgroup_id: current_user.domain.workgroup_id })
      else
        @domains = []
      end
    end
  end

  def show
    @domain = Domain.find(params[:id])

    @workgroups = Workgroup.all
  end

  def new
    @domain = Domain.new(enabled: true)

    @workgroups = Workgroup.all
  end

  def create
    @domain = Domain.new(permitted_params)
    @domain.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @domain, target_path: domains_path
        }
      end
    end
  end

  def update
    @domain = Domain.find(params[:id])
    @domain.update_attributes(permitted_params)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @domain, target_path: domains_path
        }
      end
    end
  end

  def destroy
    @domain = Domain.find(params[:id])

    unless @domain.has_data?
      @domain.destroy
    end

    redirect_to domains_path
  end

  protected

  def permitted_params
    params[:domain].permit(:name, :enabled, :workgroup_id)
  end
end
