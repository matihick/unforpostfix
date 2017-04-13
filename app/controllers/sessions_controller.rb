class SessionsController < ApplicationController
  skip_before_filter :check_logged_user

  layout 'login'

  def new
    @random_key = "x#{SecureRandom.hex(15)}"

    if current_user
      redirect_to root_url
      return
    end

    if params[:error].present?
      @error = I18n.t("login_errors.#{params[:error]}")
    end
  end

  def create
    @random_key = params[:random_key]

    @login = params["#{@random_key}login"]
    @password = params["#{@random_key}password"]

    user = User.find_by({ email: @login })

    if user && (user.authenticate(@password) || Rails.env.development?)
      if user.limited?
        session[:user_id] = nil
        # session[:expiration_time] = nil
        @error = I18n.t('login_errors.access_restricted')
        render 'new'
      else
        session[:user_id] = user.id
        # session[:expiration_time] = 1.day.from_now
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
