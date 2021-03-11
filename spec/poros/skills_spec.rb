require 'rails_helper'

describe Skills do
  before :each do
    @data = [{:str=>2, :dex=>2, :con=>-1, :int=>3, :wis=>0, :cha=>1}, ["acrobatics", "performance"], "choose two from history, insight, medicine, persuasion, and religion"]
  end

  it "exists" do
    skills = Skills.new(@data[0], @data[1], @data[2])

    expect(skills).to be_a(Skills)
    expect(skills.proficiencies).to be_a(Array)
    expect(skills.proficiencies[0]).to eq("acrobatics")
    expect(skills.proficiencies[1]).to eq("performance")
    expect(skills.proficiencies[2]).to be_a(String)
    expect(skills.proficiencies[3]).to be_a(String)
    expect(skills.proficiencies[4]).to be_a(NilClass)
    expect(skills.skills[:acrobatics]).to be_a(Integer)
    expect(skills.skills[:animal_handling]).to be_a(Integer)
    expect(skills.skills[:arcana]).to be_a(Integer)
    expect(skills.skills[:athletics]).to be_a(Integer)
    expect(skills.skills[:deception]).to be_a(Integer)
    expect(skills.skills[:history]).to be_a(Integer)
    expect(skills.skills[:insight]).to be_a(Integer)
    expect(skills.skills[:intimidation]).to be_a(Integer)
    expect(skills.skills[:investigation]).to be_a(Integer)
    expect(skills.skills[:medicine]).to be_a(Integer)
    expect(skills.skills[:nature]).to be_a(Integer)
    expect(skills.skills[:perception]).to be_a(Integer)
    expect(skills.skills[:performance]).to be_a(Integer)
    expect(skills.skills[:persuasion]).to be_a(Integer)
    expect(skills.skills[:religion]).to be_a(Integer)
    expect(skills.skills[:sleight_of_hand]).to be_a(Integer)
    expect(skills.skills[:stealth]).to be_a(Integer)
    expect(skills.skills[:survival]).to be_a(Integer)
  end

end