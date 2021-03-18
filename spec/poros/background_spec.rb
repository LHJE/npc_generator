require 'rails_helper'

describe Background do
  before :each do
    @data = {background:"Acolyte", skill_proficiency_one:"Insight (WIS)", skill_proficiency_two:"Religion (INT)", tool_proficiency_one:"-", tool_proficiency_two:"-", extra_languages:"Any 2", equipment:'A musical instrument (one of your choice) - the favor of an admirer (love letter - lock of hair - or trinket) - a costume - and a pouch containing 15 gp', personality: "I feel tremendous empathy for all who suffer.", ideal: "Greater Good. My gifts are meant to be shared with all, not used for my own benefit. (Good)", bond: "I entered seclusion because I loved someone I could not have.", flaw: "I like keeping secrets and won’t share them with anyone."}
  end

  it "exists" do
    background = Background.new(@data)

    expect(background).to be_a(Background)
    expect(background.name).to eq("Acolyte")
    expect(background.skill_proficiency_one).to eq("Insight (WIS)")
    expect(background.skill_proficiency_two).to eq("Religion (INT)")
    expect(background.tool_proficiency_one).to eq("-")
    expect(background.tool_proficiency_two).to eq("-")
    expect(background.extra_languages).to eq("Any 2")
    expect(background.equipment).to eq(["A musical instrument (one of your choice)", "the favor of an admirer (love letter", "lock of hair", "or trinket)", "a costume", "and a pouch containing 15 gp"])
    expect(background.personality).to be_a(Hash)
    expect(background.personality[:personality]).to be_a(String)
    expect(background.personality[:ideal]).to be_a(String)
    expect(background.personality[:bond]).to be_a(String)
    expect(background.personality[:flaw]).to be_a(String)
  end

end
