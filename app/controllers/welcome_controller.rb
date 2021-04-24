class WelcomeController < ApplicationController
  before_action :destroy_unsaved_npcs

  def index
    unless params[:post].nil?
      @npc = NpcFacade.create_npc(params[:post][:score_type].downcase, params[:post][:level].to_i)
    end
  end
end
