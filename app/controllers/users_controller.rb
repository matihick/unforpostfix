class UsersController < ApplicationController
  before_action :load_domain

  def new
    @user = @domain.users.build(enabled: true)
    @form_object = [@domain, @user]

    @roles = Role.all
  end

  def create
    @user = @domain.users.build(permitted_params)
    @user.save

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @user, target_path: domain_path(@domain, anchor: 'users')
        }
      end
    end
  end

  def edit
    @form_object = @user

    @roles = Role.all
  end

  def update
    attributes = permitted_params

    if attributes[:unencrypted_password].blank? && attributes[:password_confirmation].blank?
      attributes.delete(:unencrypted_password)
      attributes.delete(:password_confirmation)
    end

    @user = @domain.users.find(params[:id])
    @user.update_attributes(attributes)

    respond_to do |format|
      format.js do
        render partial: 'shared/error_messages', locals: {
          object: @user, target_path: domain_path(@domain, anchor: 'users')
        }
      end
    end
  end

  def destroy
    @user = @domain.users.where('role_code <> ?', 'administrator').find(params[:id])
    @user.destroy

    redirect_to domain_path(@domain)
  end

  protected

  def permitted_params
    if current_user.has_role?(:administrator)
      params[:user].permit(:name, :email, :unencrypted_password, :password_confirmation, :enabled, :role_code)
    else
      params[:user].permit(:name, :email, :unencrypted_password, :password_confirmation, :enabled)
    end
  end

  def load_domain
    if params[:domain_id].present?
      @domain = Domain.find(params[:domain_id])
    else
      @user = User.find(params[:id])
      @domain = @user.domain
    end
  end
end
