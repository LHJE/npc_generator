require 'rails_helper'

RSpec.describe "NPC Service" do
  it "Can return name data" do

    name = NPCService.get_npc_name

    expect(name).to be_a(Hash)
    expect(name[:name]).to be_a(Hash)
    expect(name[:name][:firstname]).to be_a(Hash)
    expect(name[:name][:firstname][:name]).to be_a(String)
    expect(name[:name][:lastname]).to be_a(Hash)
    expect(name[:name][:lastname][:name]).to be_a(String)
  end

  it "It returns ancestry data" do
    ancestry = NPCService.get_npc_ancestry

    expect(ancestry).to be_a(Hash)
    expect(ancestry[:name]).to be_a(String)

  end

  it "It returns class data" do
    class_data = NPCService.get_npc_class

    expect(class_data).to be_a(Hash)
    expect(class_data[:name]).to be_a(String)
  end
end
