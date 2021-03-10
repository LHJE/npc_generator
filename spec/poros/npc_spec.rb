require 'rails_helper'

describe NPC do
  before :each do
    @data = [{:name => "Dwarf"}, {:name => "Warlock"}]
  end

  it "exists" do
    npc = NPC.new(@data[0], @data[1])

    expect(npc).to be_a(NPC)
    expect(npc.name).to be_a(String)
    expect(npc.gender).to be_a(String)
    expect(npc.ancestry).to eq("Dwarf")
    expect(npc.background).to be_a(Background)
    expect(npc.background.name).to be_a(String)
    expect(npc.background.skill_proficiency_one).to be_a(String)
    expect(npc.background.skill_proficiency_two).to be_a(String)
    expect(npc.background.tool_proficiency_one).to be_a(String)
    expect(npc.background.tool_proficiency_two).to be_a(String)
    expect(npc.background.extra_languages).to be_a(String)
    expect(npc.class).to eq("Warlock")
  end

end
