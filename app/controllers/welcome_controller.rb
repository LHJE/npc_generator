class WelcomeController < ApplicationController
  def index
    @npc = NPCFacade.create_npc
  end
end
