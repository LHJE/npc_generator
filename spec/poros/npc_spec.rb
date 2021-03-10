require 'rails_helper'

describe NPC do
  before :each do
    @data = [{:name => "Dwarf"}, {:name => "Acolyte"}, {:name => "Warlock"}]
  end

  it "exists" do
    npc = NPC.new(@data[0], @data[1], @data[2])

    expect(npc).to be_a(NPC)
    expect(npc.name).to be_a(String)
    expect(npc.gender).to be_a(String)
    expect(npc.ancestry).to eq("Dwarf")
    expect(npc.background).to eq("Acolyte")
    expect(npc.class).to eq("Warlock")
  end

end
