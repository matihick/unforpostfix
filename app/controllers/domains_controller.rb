class DomainsController < ApplicationController
  def index
    @domains = Domain.all
  end

  def show
    @domain = Domain.find(params[:id])
  end

  def new
    @domain = Domain.new(enabled: true)
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

  def edit
    @domain = Domain.find(params[:id])
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
    params[:domain].permit(:name, :enabled)
  end
end
