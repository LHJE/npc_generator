require 'rails_helper'

describe CoreStats do
  before :each do
    @data = [{:attributes=>["Dexterity"], :value=>2}, {:attributes=>["Charisma"], :value=>1}]
  end

  it "exists" do
    core_stats = CoreStats.new(@data, 'standard array')

    expect(core_stats).to be_a(CoreStats)
    expect(core_stats.stats).to be_a(Hash)
    expect(core_stats.stats[:str]).to be_a(Integer)
    expect(core_stats.stats[:dex]).to be_a(Integer)
    expect(core_stats.stats[:con]).to be_a(Integer)
    expect(core_stats.stats[:int]).to be_a(Integer)
    expect(core_stats.stats[:wis]).to be_a(Integer)
    expect(core_stats.stats[:cha]).to be_a(Integer)
  end

end
