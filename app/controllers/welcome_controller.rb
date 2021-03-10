class WelcomeController < ApplicationController
  def index
    @npc = NPCFacade.get_npc
  end
end
