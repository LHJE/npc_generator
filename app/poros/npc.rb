require 'CSV'

class NPC
  attr_reader :name,
              :gender,
              :ancestry,
              :background,
              :class

  def initialize(ancestry, class_data)
    @name = "#{Faker::Games::WarhammerFantasy.hero.split(' ')[0]} #{Faker::Science.scientist.split(' ')[0]} #{Faker::FunnyName.two_word_name.split(' ')[1]}"
    @gender = File.read("app/assets/data/genders.txt").split("\n").sample
    @ancestry = ancestry[:name]
    @background = create_npc_background
    @class = class_data[:name]
  end

  def create_npc_background
    backgrounds = []
    CSV.foreach('app/assets/data/backgrounds.csv', headers: true, header_converters: :symbol) do |data|
      backgrounds << Background.new(data)
    end
    backgrounds.sample
  end
end
