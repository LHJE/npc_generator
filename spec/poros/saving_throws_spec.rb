require 'rails_helper'

describe SavingThrows do
  before :each do
    @data = [CoreStats.new([{:attributes=>["Dexterity"], :value=>2}, {:attributes=>["Charisma"], :value=>1}], "standard array"), ["Intelligence", "Wisdom"]]
  end

  it "exists" do
    saving_throws = SavingThrows.new(@data[0], @data[1])

    expect(saving_throws).to be_a(SavingThrows)
    expect(saving_throws.throws).to be_a(Hash)
    expect(saving_throws.throws[:str]).to be_a(Integer)
    expect(saving_throws.throws[:dex]).to be_a(Integer)
    expect(saving_throws.throws[:con]).to be_a(Integer)
    expect(saving_throws.throws[:int]).to be_a(Integer)
    expect(saving_throws.throws[:wis]).to be_a(Integer)
    expect(saving_throws.throws[:cha]).to be_a(Integer)
  end

end
