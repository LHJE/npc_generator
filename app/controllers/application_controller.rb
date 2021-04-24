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
    NpcModel.where(is_saved: 0).destroy_all
  end

  def check_if_saving_npc
    if NpcModel.where(is_saved: 0).count.positive?
      UserNpcModel.create!(npc_model_id: NpcModel.where(is_saved: 0)[0].id, user_id: current_user.id)
      NpcModel.where(is_saved: 0)[0].update(is_saved: 1)
    end
  end
end
