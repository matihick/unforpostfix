class Api::UsersController < Api::BaseApiController
  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.new({
      domain_id: Domain.enabled.find(params[:domain_id]).id,
      name: params[:name],
      email: params[:email],
      unencrypted_password: params[:password],
      password_confirmation: params[:password],
      enabled: (['1','true'].include?(params[:enabled]))
    }.keep_if { |k,v| v.present? })

    @user.save!

    render json: @user
  end

  def update
    attrs = {
      name: params[:name],
      email: params[:email],
      enabled: (['1','true'].include?(params[:enabled])),
      unencrypted_password: params[:password],
      password_confirmation: params[:password]
    }.keep_if { |k,v| v.present? }

    attrs.delete_if { |k,v| v.nil? }

    @user = User.find(params[:id])
    @user.update_attributes!(attrs)

    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render json: { success: true }
  end
end
