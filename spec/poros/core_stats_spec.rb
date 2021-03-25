require 'rails_helper'

describe CoreStats do
  before :each do
    @data = [{:attributes=>["Dexterity"], :value=>2}, {:attributes=>["Charisma"], :value=>1}]
  end

  it "exists" do
    core_stats = CoreStats.new(@data, 'min/maxed point buy', { str: 40 })

    expect(core_stats).to be_a(CoreStats)
    expect(core_stats.stats).to be_a(Hash)
    expect(core_stats.stats[:modifiers]).to be_a(Hash)
    expect(core_stats.stats[:modifiers][:str_mod]).to be_a(Integer)
    expect(core_stats.stats[:modifiers][:dex_mod]).to be_a(Integer)
    expect(core_stats.stats[:modifiers][:con_mod]).to be_a(Integer)
    expect(core_stats.stats[:modifiers][:int_mod]).to be_a(Integer)
    expect(core_stats.stats[:modifiers][:wis_mod]).to be_a(Integer)
    expect(core_stats.stats[:modifiers][:cha_mod]).to be_a(Integer)
    expect(core_stats.stats[:scores]).to be_a(Hash)
    expect(core_stats.stats[:scores][:str]).to be_a(Integer)
    expect(core_stats.stats[:scores][:dex]).to be_a(Integer)
    expect(core_stats.stats[:scores][:con]).to be_a(Integer)
    expect(core_stats.stats[:scores][:int]).to be_a(Integer)
    expect(core_stats.stats[:scores][:wis]).to be_a(Integer)
    expect(core_stats.stats[:scores][:cha]).to be_a(Integer)
  end

end
