require 'rails_helper'

describe Background do
  before :each do
    @data = {background:"Acolyte", skill_proficiency_one:" Insight (WIS)", skill_proficiency_two:" Religion (INT)", tool_proficiency_one:" -", tool_proficiency_two:" -", extra_languages:" Any 2"}
  end

  it "exists" do
    background = Background.new(@data)

    expect(background).to be_a(Background)
    expect(background.name).to be_a(String)
    expect(background.skill_proficiency_one).to be_a(String)
    expect(background.skill_proficiency_two).to be_a(String)
    expect(background.tool_proficiency_one).to be_a(String)
    expect(background.tool_proficiency_two).to be_a(String)
    expect(background.extra_languages).to be_a(String)
  end

end
