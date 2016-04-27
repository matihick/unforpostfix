class SessionsController < ApplicationController
  skip_before_filter :check_logged_user

  layout 'login'

  def new
    if current_user
      redirect_to root_url
      return
    end

    @return_url = params[:return_url]

    if params[:error].present?
      @error = I18n.t("login_errors.#{params[:error]}")
    end
  end

  def create
    user = User.find_by({ email: params[:email] })
    p user
    bypass_login = Rails.env.development? || (CONFIG[:bypass_login] == 'true')

    if user && (user.authenticate(params[:password]) || bypass_login)
      if user.limited?
        session[:user_id] = nil
        @error = I18n.t('login_errors.access_restricted')
        render 'new'
      else
        session[:user_id] = user.id
        redirect_to root_url, notice: "Usuario autenticado!"
      end
    else
      @error = I18n.t('login_errors.invalid_login')
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
