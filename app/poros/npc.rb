require 'csv'

class NPC
  attr_reader :name,
              :gender,
              :ancestry,
              :background,
              :speed,
              :class,
              :stats

  def initialize(ancestry, class_data, score_type)
    @name = "#{Faker::Games::WarhammerFantasy.hero.split(' ')[0]} #{Faker::Science.scientist.split(' ')[0]} #{Faker::FunnyName.two_word_name.split(' ')[1]}"
    @gender = File.read('app/assets/data/genders.txt').split("\n").sample
    @ancestry = ancestry[:name]
    @background = create_npc_background
    @class = class_data[:name]
    @speed = ancestry[:speed][:walk]
    @stats = Stats.new(ancestry, @background, class_data, score_type)
  end

  def create_npc_background
    backgrounds = []
    CSV.foreach('app/assets/data/backgrounds.csv', headers: true, header_converters: :symbol) do |data|
      backgrounds << Background.new(data)
    end
    backgrounds.sample
  end
end
