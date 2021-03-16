require 'csv'

class NPC
  attr_reader :name,
              :gender,
              :ancestry,
              :sub_ancestry,
              :background,
              :speed,
              :class,
              :stats,
              :languages,
              :vision,
              :size,
              :traits,
              :proficiencies,
              :alignment

  def initialize(ancestry, class_data, score_type)
    @name           = "#{Faker::Games::WarhammerFantasy.hero.split(' ')[0]} #{Faker::Science.scientist.split(' ')[0]} #{Faker::FunnyName.two_word_name.split(' ')[1]}"
    @gender        = File.read('app/assets/data/genders.txt').split("\n").sample
    @alignment = ['Lawful Good', 'Neutral Good', 'Chaotic Good', 'Lawful Neutral', 'True Neutral', 'Chaotic Neutral', 'Lawful Evil', 'Neutral Evil', 'Chaotic Evil', 'Unaligned'].sample
    @ancestry      = ancestry[:name]
    @sub_ancestry  = ancestry[:subraces] != [] ? ancestry[:subraces].sample : "No Sub Ancestry"
    @class         = class_data[:name]
    @speed         = ancestry[:speed][:walk]
    @size          = find_size(ancestry[:size][12..-1].scan(/\d+/))
    @languages     = ['common', find_languages(ancestry[:languages][54..-1])].flatten
    @vision        = ancestry[:vision].nil? || ancestry[:vision] == "" ? "Darkvision" : "No Darkvision"
    @traits        = find_traits(ancestry, @sub_ancestry)
    @background    = create_npc_background
    @stats         = Stats.new(ancestry, @sub_ancestry, @background, class_data, score_type)
    @proficiencies = Proficiencies.new(class_data)
    # require "pry"; binding.pry
  end

  def create_npc_background
    backgrounds = []
    CSV.foreach('app/assets/data/backgrounds.csv', headers: true, header_converters: :symbol) do |data|
      backgrounds << Background.new(data)
    end
    backgrounds.sample
  end

  def find_languages(languages)
    case languages[0]
    when ','
      ['elvish', 'one extra language of your choice']
    when ' '
      languages.split('.')[0][5..-1].downcase
    end
  end

  def find_size(size)
    if size[0] == "6"
      [rand(72..84), 'medium']
    elsif size == [] || size[0] == "5"
      [rand(60..72), 'medium']
    elsif size[0] == "4"
      [rand(48..60), 'medium']
    elsif size[0] == "3"
      [rand(36..48), 'small']
    end
  end

  def find_traits(ancestry, sub_ancestry)
    if ancestry[:traits] == ""
      ancestry[:traits] << "No extra traits"
    elsif ancestry[:name] == "Dragonborn"
      ancestry[:traits] = ancestry[:traits][842..893] + ancestry[:traits][1055..-1]
      ancestry[:traits] << " Draconic Ancestry: " + File.read('app/assets/data/dragonborn_traits.txt').split("\n").sample
    elsif sub_ancestry != "No Sub Ancestry"
      ancestry[:traits] << sub_ancestry[:traits]
    end
    ancestry[:traits]
  end

end
