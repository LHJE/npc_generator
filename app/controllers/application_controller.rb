class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    return if current_user

    flash[:notice] = 'This Page Only Accessible by Authenticated Users. Please Log In.'
    redirect_to root_path
  end

  def generate_flash(resource)
    resource.errors.messages.each do |validation, message|
      flash[validation] = "#{validation}: #{message}"
    end
  end
end
