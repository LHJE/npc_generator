require 'rails_helper'

describe NPC do
  before :each do
    @data = [{:firstname => "Flig", :lastname => "Brittlebeak"}, "Dwarf", "Warlock"]
  end

  it "exists" do
    npc = NPC.new(@data[0], @data[1], @data[2])

    expect(npc).to be_a(NPC)
    expect(npc.name).to eq("Flig Brittlebeak")
    expect(npc.ancestry).to eq("Dwarf")
    expect(npc.class).to eq("Warlock")
  end

end
