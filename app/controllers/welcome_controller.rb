class WelcomeController < ApplicationController
  def index
    @npc = NPCFacade.create_npc(params[:post][:score_type].downcase) unless params[:post].nil?
  end
end
