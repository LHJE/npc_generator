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

  def destroy
    user = User.find(current_user.id)
    UserNpcModel.where(user_id: user.id).map do |user_npc_model|
      NpcModel.where(id: user_npc_model.npc_model_id).ids.map do |id|
        NpcModelArmor.where(npc_model_id: id).destroy_all
        NpcModelPack.where(npc_model_id: id).destroy_all
        NpcModelWeapon.where(npc_model_id: id).destroy_all
        NpcModelSpell.where(npc_model_id: id).destroy_all
        UserNpcModel.where(npc_model_id: id).destroy_all
      end
      NpcModel.where(id: user_npc_model.npc_model_id).destroy_all
    end
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
