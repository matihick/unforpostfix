class WorkgroupsController < ApplicationController
  before_action :check_if_administrator

  def index
    @workgroups = Workgroup.all
  end

  def new
    @workgroup = Workgroup.new
  end

  def create
    @workgroup = Workgroup.new(permitted_params)
    @workgroup.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @workgroup, target_path: workgroups_path
        }
      end
    end
  end

  def edit
    @workgroup = Workgroup.find(params[:id])
  end

  def update
    @workgroup = Workgroup.find(params[:id])
    @workgroup.update_attributes(permitted_params)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @workgroup, target_path: workgroups_path
        }
      end
    end
  end

  def destroy
    @workgroup = Workgroup.find(params[:id])
    @workgroup.destroy

    redirect_to workgroups_path
  end

  protected

  def permitted_params
    params[:workgroup].permit(:name)
  end
end
