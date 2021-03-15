class WelcomeController < ApplicationController
  def index
    if !params[:post].nil?
      @npc = NPCFacade.create_npc(params[:post][:score_type].downcase)
    end
  end
end
