class SessionsController < ApplicationController
  def create
    access_token = auth_hash
    user = User.from_omniauth(access_token)
    user.google_token = access_token.credentials.token
    user.name = access_token.info.name.split('@')[0]
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    session[:user_id] = user.id
    flash[:notice] = "Logged in as #{user.name}"
    if user.admin?
      redirect_to '/admin/dashboard'
    else
      redirect_to '/user/dashboard'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have been logged out!'
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
