class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  def show
    if !User.all.pluck(:id).include?(params[:id].to_i)
      redirect_to '/admin/users/'
    else
      @user = User.find(params[:id])
    end
  end
end
