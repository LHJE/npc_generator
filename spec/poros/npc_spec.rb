require 'rails_helper'

describe NPC do
  before :each do
    @data = [{firstname => "Flig", lastname => "Brittlebeak"}, "Dwarf", "Warlock"]
  end

  it "exists" do
    npc = NPC.new(@data)

    expect(npc).to be_a(NPC)
  end

end
