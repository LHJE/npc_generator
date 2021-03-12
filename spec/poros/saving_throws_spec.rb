require 'rails_helper'

describe SavingThrows do
  before :each do
    @data = [{:str=>2, :dex=>-1, :con=>0, :int=>1, :wis=>1, :cha=>3}, ["Intelligence", "Wisdom"]]
  end

  it "exists" do
    saving_throws = SavingThrows.new(@data[0], @data[1])

    expect(saving_throws).to be_a(SavingThrows)
    expect(saving_throws.throws).to be_a(Hash)
    expect(saving_throws.throws[:str]).to eq(2)
    expect(saving_throws.throws[:dex]).to eq(-1)
    expect(saving_throws.throws[:con]).to eq(0)
    expect(saving_throws.throws[:int]).to eq(3)
    expect(saving_throws.throws[:wis]).to eq(3)
    expect(saving_throws.throws[:cha]).to eq(3)
  end

end
