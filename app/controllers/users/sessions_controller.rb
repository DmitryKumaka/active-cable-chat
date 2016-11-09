class Users::SessionsController < Devise::SessionsController
before_action :configure_sign_in_params, only: [:create]

  def create
    if user = User.where(email: params[:user][:email]).first
      sign_in(:user, user)
      yield resource if block_given?
      redirect_to root_path
    else
      redirect_to new_user_registration_path
    end
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attr])
  end
end
