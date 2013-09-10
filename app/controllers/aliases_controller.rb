class AliasesController < ApplicationController
  before_action :load_domain

  def new
    @alias = @domain.aliases.build(enabled: true)
    @form_object = [@domain, @alias]
  end

  def create
    @alias = @domain.aliases.build(permitted_params)
    @alias.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @alias, target_path: domain_path(@domain, anchor: 'aliases')
        }
      end
    end
  end

  def edit
    @alias.to = @alias.to.split(',').each_slice(4).map { |elem| elem.join(', ') }.join("\r\n")
    @form_object = @alias
  end

  def update
    @alias.update_attributes(permitted_params)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @alias, target_path: domain_path(@domain, anchor: 'aliases')
        }
      end
    end
  end

  def destroy
    @alias.destroy

    redirect_to domain_path(@domain, anchor: 'aliases')
  end

  protected

  def permitted_params
    params[:alias].permit(:from, :to, :enabled)
  end

  def load_domain
    if params[:domain_id].present?
      @domain = Domain.find(params[:domain_id])
    else
      @alias = Alias.find(params[:id])
      @domain = @alias.domain
    end
  end
end
