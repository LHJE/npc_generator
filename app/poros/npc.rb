class NPC
  attr_reader :name,
              :gender,
              :ancestry,
              :class

  def initialize(ancestry, class_data)
    @name = "#{Faker::Games::WarhammerFantasy.hero.split(' ')[0]} #{Faker::Science.scientist.split(' ')[0]} #{Faker::FunnyName.two_word_name.split(' ')[1]}"
    @gender = File.read("app/assets/data/genders.txt").split("\n").sample
    @ancestry = ancestry
    @class = class_data
  end
end
