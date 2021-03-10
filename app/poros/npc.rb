class NPC
  attr_reader :name,
              :gender,
              :ancestry,
              :background,
              :class

  def initialize(ancestry, background, class_data)
    @name = "#{Faker::Games::WarhammerFantasy.hero.split(' ')[0]} #{Faker::Science.scientist.split(' ')[0]} #{Faker::FunnyName.two_word_name.split(' ')[1]}"
    @gender = File.read("app/assets/data/genders.txt").split("\n").sample
    @ancestry = ancestry[:name]
    @background = background[:name]
    @class = class_data[:name]
  end
end
