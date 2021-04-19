class Admin::NpcsController < ApplicationController
  before_action :require_admin

  def index
    @npcs = NpcModel.all
  end
end
