class Api::AliasesController < Api::BaseApiController
  def show
    render json: Alias.find(params[:id])
  end

  def create
    @alias = Alias.new({
      domain_id: Domain.enabled.find(params[:domain_id]).id,
      name: params[:name],
      from: params[:from],
      to: params[:to]
    })

    @alias.save!

    render json: @alias
  end

  def update
    attrs = {
      name: params[:name],
      from: params[:from],
      to: params[:to],
      enabled: params[:enabled]
    }

    attrs.delete_if { |k,v| v.nil? }

    @alias = Alias.find(params[:id])
    @alias.update_attributes!(attrs)

    render json: @alias
  end

  def destroy
    @alias = Alias.find(params[:id])
    @alias.destroy

    render json: { success: true }
  end
end
