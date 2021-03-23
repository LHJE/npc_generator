require 'csv'

class NPC
  attr_reader :alignment,
              :ancestry,
              :sub_ancestry,
              :background,
              :character_class,
              :gender,
              :hit_dice,
              :languages,
              :name,
              :proficiencies,
              :size,
              :speed,
              :spells,
              :traits,
              :vision,
              :armor_class,
              :equipment,
              :initiative,
              :stats

  def initialize(ancestry, class_data, score_type)
    @alignment     = find_alignment
    @ancestry      = ancestry[:name]
    @sub_ancestry  = ancestry[:subraces] != [] ? ancestry[:subraces].sample : 'No Sub Ancestry'
    @background    = create_npc_background
    @character_class = class_data[:name]
    @gender = File.read('app/assets/data/genders.txt').split("\n").sample
    @hit_dice      = class_data[:hit_dice]
    @languages     = ['common', find_languages(ancestry[:languages][54..-1])].flatten
    @name          = find_name
    @proficiencies = Proficiencies.new(class_data)
    @size          = find_size(ancestry[:size][12..-1].scan(/\d+/))
    @speed         = ancestry[:speed][:walk]
    @spells        = find_spells
    @traits        = find_traits(ancestry, @sub_ancestry)
    @vision        = ancestry[:vision].nil? || ancestry[:vision] == '' ? 'No Darkvision' : 'Darkvision'
    # The below are not in alphabetical order because they need the objects above
    @equipment     = Equipment.new(@character_class, @background.equipment, @proficiencies)
    @stats = Stats.new(ancestry, @sub_ancestry, @background, class_data, score_type, @traits)
    @armor_class   = find_armor_class(@stats.core_stats.stats[:modifiers][:dex_mod], @equipment.armor)
    @initiative    = @stats.core_stats.stats[:modifiers][:dex_mod]
  end

  def find_alignment
    ['Lawful Good', 'Neutral Good', 'Chaotic Good', 'Lawful Neutral', 'True Neutral', 'Chaotic Neutral',
     'Lawful Evil', 'Neutral Evil', 'Chaotic Evil', 'Unaligned'].sample
  end

  def find_name
    "#{Faker::Games::WarhammerFantasy.hero.split(' ')[0]} #{Faker::Science.scientist.split(' ')[0]} #{Faker::FunnyName.two_word_name.split(' ')[1]}"
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
    if size[0] == '6'
      "#{rand(72..84)} in, medium"
    elsif size == [] || size[0] == '5'
      "#{rand(60..72)} in, medium"
    elsif size[0] == '4'
      "#{rand(48..60)} in, medium"
    elsif size[0] == '3'
      "#{rand(36..48)} in, small"
    end
  end

  def find_traits(ancestry, sub_ancestry)
    if ancestry[:traits] == ''
      ancestry[:traits] << 'No extra traits'
    elsif ancestry[:name] == 'Dragonborn'
      ancestry[:traits] = ancestry[:traits][842..893] + ancestry[:traits][1055..-1]
      ancestry[:traits] << " Draconic Ancestry: #{File.read('app/assets/data/dragonborn_traits.txt').split("\n").sample}"
    elsif sub_ancestry != 'No Sub Ancestry'
      ancestry[:traits] << sub_ancestry[:traits]
    end
    ancestry[:traits].split("\n").reject(&:empty?)
  end

  def find_armor_class(dex, armor)
    if armor[0] == ''
      10 + dex
    elsif armor.length > 1
      armor.each do |piece|
        if armor.index(piece).zero?
          @ac = determine_ac(armor, piece, dex)
        else
          @ac += determine_ac(armor, piece, dex)
        end
      end
      @ac
    else
      determine_ac(armor, armor[0], dex)
    end
  end

  def determine_ac(armor, piece, dex)
    if piece.armor_class[-7..-1] == '(max 2)'
      if dex > 2
        2 + piece.armor_class.scan(/\d+/)[0].to_i
      else
        dex + piece.armor_class.scan(/\d+/)[0].to_i
      end
    elsif piece.armor_class == '16' && armor.index(piece) != 1
      16
    elsif piece.armor_class == '16' && armor.index(piece) == 1
      18
    elsif piece.name == 'Shield'
      2
    else
      dex + piece.armor_class.scan(/\d+/)[0].to_i
    end
  end

  def find_spells
    case @character_class
    when 'Barbarian'
      "Not a spellcaster"
    when 'Monk'
      "Not a spellcaster"
    when 'Fighter'
      "Not a spellcaster"
    when 'Rogue'
      # find_rogue_spells ? @sub_class == "Arcane Trickster" : "Not a spellcaster"
      # For the future ^^^
      "Not a spellcaster"
    when 'Bard'
      find_bard_spells
    when 'Cleric'
      find_cleric_spells
    when 'Druid'
      find_druid_spells
    when 'Paladin'
      find_paladin_spells
    when 'Ranger'
      find_ranger_spells
    when 'Sorcerer'
      find_sorcerer_spells
    when 'Warlock'
      find_warlock_spells
    when 'Wizard'
      find_wizard_spells
    end

  end

  def find_bard_spells
    spells = Spell.where('classes LIKE ?', '%' + @character_class + '%')
    require "pry"; binding.pry
  end

  def find_cleric_spells
    spells = Spell.where('classes LIKE ?', '%' + @character_class + '%')
    require "pry"; binding.pry
  end

  def find_druid_spells
    spells = Spell.where('classes LIKE ?', '%' + @character_class + '%')
    require "pry"; binding.pry
  end

  def find_paladin_spells
    spells = Spell.where('classes LIKE ?', '%' + @character_class + '%')
    require "pry"; binding.pry
  end

  def find_ranger_spells
    spells = Spell.where('classes LIKE ?', '%' + @character_class + '%')
    require "pry"; binding.pry
  end

  def find_sorcerer_spells
    spells = Spell.where('classes LIKE ?', '%' + @character_class + '%')
    require "pry"; binding.pry
  end

  def find_warlock_spells
    spells = Spell.where('classes LIKE ?', '%' + @character_class + '%')
    require "pry"; binding.pry
  end

  def find_wizard_spells
    spells = Spell.where('classes LIKE ?', '%' + @character_class + '%')
    require "pry"; binding.pry
  end

end
