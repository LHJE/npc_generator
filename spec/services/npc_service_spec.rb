require 'rails_helper'

RSpec.describe "NPC Service" do
  it "It returns ancestry data" do
    ancestry = NPCService.get_npc_ancestry

    expect(ancestry).to be_a(Hash)
    expect(ancestry[:index]).to be_a(String)
    expect(ancestry[:name]).to be_a(String)
    expect(ancestry[:url]).to be_a(String)
  end

  it "It returns class data" do
    class_data = NPCService.get_npc_class

    expect(class_data).to be_a(Hash)
    expect(class_data[:index]).to be_a(String)
    expect(class_data[:name]).to be_a(String)
    expect(class_data[:url]).to be_a(String)
  end
end
