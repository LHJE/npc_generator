require 'rails_helper'

RSpec.describe "NPC Service" do
  it "It returns ancestry data" do
    ancestry = NPCService.create_npc_ancestry

    expect(ancestry).to be_a(Hash)
    expect(ancestry[:name]).to be_a(String)
    expect(ancestry[:slug]).to be_a(String)
    expect(ancestry[:desc]).to be_a(String)
    expect(ancestry[:asi_desc]).to be_a(String)
    expect(ancestry[:asi]).to be_a(Array)
    expect(ancestry[:asi][0]).to be_a(Hash)
    expect(ancestry[:asi][0][:attributes]).to be_a(Array)
    expect(ancestry[:asi][0][:attributes][0]).to be_a(String)
    expect(ancestry[:asi][0][:value]).to be_a(Integer)
    expect(ancestry[:age]).to be_a(String)
    expect(ancestry[:alignment]).to be_a(String)
    expect(ancestry[:size]).to be_a(String)
    expect(ancestry[:speed]).to be_a(Hash)
    expect(ancestry[:speed][:walk]).to be_a(Integer)
    expect(ancestry[:speed_desc]).to be_a(String)
    if !ancestry[:language].nil?
      require "pry"; binding.pry
      expect(ancestry[:language]).to be_a(String)
    end
    expect(ancestry[:vision]).to be_a(String)
    expect(ancestry[:traits]).to be_a(String)
    expect(ancestry[:subraces]).to be_a(Array)
    if !ancestry[:subraces][0].nil?
      require "pry"; binding.pry
      expect(ancestry[:subraces][0]).to be_a(Hash)
      expect(ancestry[:subraces][0][:name]).to be_a(String)
      expect(ancestry[:subraces][0][:slug]).to be_a(String)
      expect(ancestry[:subraces][0][:desc]).to be_a(String)
      expect(ancestry[:subraces][0][:asi]).to be_a(String)
    end
    expect(ancestry[:document__slug]).to be_a(String)
    expect(ancestry[:document__title]).to be_a(String)
    expect(ancestry[:document__license_url]).to be_a(String)
  end

  it "It returns class data" do
    class_data = NPCService.create_npc_class
    # require "pry"; binding.pry

    expect(class_data).to be_a(Hash)
    expect(class_data[:name]).to be_a(String)
    expect(class_data[:slug]).to be_a(String)
    expect(class_data[:desc]).to be_a(String)
    expect(class_data[:hit_dice]).to be_a(String)
    expect(class_data[:hp_at_1st_level]).to be_a(String)
    expect(class_data[:hp_at_higher_levels]).to be_a(String)
    expect(class_data[:prof_armor]).to be_a(String)
    expect(class_data[:prof_weapons]).to be_a(String)
    expect(class_data[:prof_tools]).to be_a(String)
    expect(class_data[:prof_saving_throws]).to be_a(String)
    expect(class_data[:prof_skills]).to be_a(String)
    expect(class_data[:equipment]).to be_a(String)
    expect(class_data[:table]).to be_a(String)
    expect(class_data[:spellcasting_ability]).to be_a(String)
    expect(class_data[:subtypes_name]).to be_a(String)
    expect(class_data[:archetypes]).to be_a(Array)
    expect(class_data[:archetypes][0]).to be_a(Hash)
    expect(class_data[:archetypes][0][:name]).to be_a(String)
    expect(class_data[:archetypes][0][:slug]).to be_a(String)
    expect(class_data[:archetypes][0][:desc]).to be_a(String)
    expect(class_data[:archetypes][0][:document__slug]).to be_a(String)
    expect(class_data[:archetypes][0][:document__title]).to be_a(String)
    expect(class_data[:archetypes][0][:document__license_url]).to be_a(String)
    expect(class_data[:document__slug]).to be_a(String)
    expect(class_data[:document__title]).to be_a(String)
    expect(class_data[:document__license_url]).to be_a(String)
  end
end
