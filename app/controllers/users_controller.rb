class UsersController < ApplicationController
  def new
    if !current_user.nil?
      flash[:notice] = 'You are already registerd.'
      redirect_to '/user/dashboard'
    else
      @user = User.new
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.name}!"
      redirect_to '/user/dashboard'
    else
      generate_flash(@user)
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
