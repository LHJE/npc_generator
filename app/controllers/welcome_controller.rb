class WelcomeController < ApplicationController
  before_action :destroy_unsaved_npcs

  def index
    unless params[:post].nil?
      base_info = NPCFacade.create_npc(params[:post][:score_type].downcase, params[:post][:level].to_i)
      @npc = base_info[0]
      @pack = base_info[1]
      @armor = base_info[2]
      @weapons = base_info[3]
      @spells = base_info[4]
    end
  end
end
