class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    return if current_user

    flash[:notice] = 'This Page Only Accessible by Authenticated Users. Please Log In.'
    redirect_to root_path
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_admin
    render file: 'public/404', status: :not_found unless current_admin?
  end

  def exclude_admin
    render file: 'public/404', status: :not_found if current_admin?
  end

  def destroy_unsaved_npcs
    NpcModel.where(is_saved: 0).ids.map do |id|
      NpcModelArmor.where(npc_model_id: id).destroy_all
      NpcModelPack.where(npc_model_id: id).destroy_all
      NpcModelWeapon.where(npc_model_id: id).destroy_all
      NpcModelSpell.where(npc_model_id: id).destroy_all
    end
    NpcModel.where(is_saved: 0).destroy_all
  end
end
