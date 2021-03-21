class SessionsController < ApplicationController
  def new
    return unless current_user

    flash[:notice] = 'You are already logged in!'
    login_redirect(current_user)
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{user.name}"
      redirect_to "/user/dashboard"
    else
      flash[:notice] = "Sorry, we don't recognize those credentials."
      render :new
    end
  end

  def logout
    session.delete(:user_id)
    flash[:notice] = 'You have been logged out!'
    redirect_to root_path
  end

  private

  def login_redirect(user)
    session[:user_id] = user.id
    redirect_to "/user/dashboard"
  end
end
