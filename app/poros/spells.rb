class Spells
  attr_reader :all_spells,
              :current_spells,
              :spell_slots

  def initialize(character_class, level)
    case character_class
    when 'Barbarian'
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    when 'Monk'
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    when 'Fighter'
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    when 'Rogue'
      # find_rogue_spells ? @sub_class == "Arcane(level) Trickster" : "Not a spellcaster"
      # For the future ^^^
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    when 'Bard'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_bard_spells(level)
      find_bard_spell_slots(level)
    when 'Cleric'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_cleric_spells(level)
      find_cleric_spell_slots(level)
    when 'Druid'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_druid_spells(level)
      find_druid_spell_slots(level)
    when 'Paladin'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_paladin_spells(level)
      find_paladin_spell_slots(level)
    when 'Ranger'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_ranger_spells(level)
      find_ranger_spell_slots(level)
    when 'Sorcerer'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_sorcerer_spells(level)
      find_sorcerer_spell_slots(level)
    when 'Warlock'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_warlock_spells(level)
      find_warlock_spell_slots(level)
    when 'Wizard'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_wizard_spells(level)
      find_wizard_spell_slots(level)
    end
  end

  def find_bard_spells(level)
    # @current_spells =
    case level
    when "1"
    when "2"
    when "3"
    when "4"
    when "5"
    when "6"
    when "7"
    when "8"
    when "9"
    when "10"
    when "11"
    when "12"
    when "13"
    when "14"
    when "15"
    when "16"
    when "17"
    when "18"
    when "19"
    when "20"
    end
    require "pry"; binding.pry
  end

  def find_cleric_spells(level)
    # @current_spells =
    case level
    when "1"
    when "2"
    when "3"
    when "4"
    when "5"
    when "6"
    when "7"
    when "8"
    when "9"
    when "10"
    when "11"
    when "12"
    when "13"
    when "14"
    when "15"
    when "16"
    when "17"
    when "18"
    when "19"
    when "20"
    end
    require "pry"; binding.pry
  end

  def find_druid_spells(level)
    # @current_spells =
    case level
    when "1"
    when "2"
    when "3"
    when "4"
    when "5"
    when "6"
    when "7"
    when "8"
    when "9"
    when "10"
    when "11"
    when "12"
    when "13"
    when "14"
    when "15"
    when "16"
    when "17"
    when "18"
    when "19"
    when "20"
    end
    require "pry"; binding.pry
  end

  def find_paladin_spells(level)
    # @current_spells =
    case level
    when "1"
    when "2"
    when "3"
    when "4"
    when "5"
    when "6"
    when "7"
    when "8"
    when "9"
    when "10"
    when "11"
    when "12"
    when "13"
    when "14"
    when "15"
    when "16"
    when "17"
    when "18"
    when "19"
    when "20"
    end
    require "pry"; binding.pry
  end

  def find_ranger_spells(level)
    # @current_spells =
    case level
    when "1"
    when "2"
    when "3"
    when "4"
    when "5"
    when "6"
    when "7"
    when "8"
    when "9"
    when "10"
    when "11"
    when "12"
    when "13"
    when "14"
    when "15"
    when "16"
    when "17"
    when "18"
    when "19"
    when "20"
    end
    require "pry"; binding.pry
  end

  def find_sorcerer_spells(level)
    # @current_spells =
    case level
    when "1"
    when "2"
    when "3"
    when "4"
    when "5"
    when "6"
    when "7"
    when "8"
    when "9"
    when "10"
    when "11"
    when "12"
    when "13"
    when "14"
    when "15"
    when "16"
    when "17"
    when "18"
    when "19"
    when "20"
    end
    require "pry"; binding.pry
  end

  def find_warlock_spells(level)
    # @current_spells =
    case level
    when "1"
    when "2"
    when "3"
    when "4"
    when "5"
    when "6"
    when "7"
    when "8"
    when "9"
    when "10"
    when "11"
    when "12"
    when "13"
    when "14"
    when "15"
    when "16"
    when "17"
    when "18"
    when "19"
    when "20"
    end
    require "pry"; binding.pry
  end

  def find_wizard_spells(level)
    # @current_spells =
    case level
    when "1"
    when "2"
    when "3"
    when "4"
    when "5"
    when "6"
    when "7"
    when "8"
    when "9"
    when "10"
    when "11"
    when "12"
    when "13"
    when "14"
    when "15"
    when "16"
    when "17"
    when "18"
    when "19"
    when "20"
    end
    require "pry"; binding.pry
  end

  def find_bard_spell_slots(level)
    # @spell_slots =
    require "pry"; binding.pry
  end

  def find_cleric_spell_slots(level)
    # @spell_slots =
    require "pry"; binding.pry
  end

  def find_druid_spell_slots(level)
    # @spell_slots =
    require "pry"; binding.pry
  end

  def find_paladin_spell_slots(level)
    # @spell_slots =
    require "pry"; binding.pry
  end

  def find_ranger_spell_slots(level)
    # @spell_slots =
    require "pry"; binding.pry
  end

  def find_sorcerer_spell_slots(level)
    # @spell_slots =
    require "pry"; binding.pry
  end

  def find_warlock_spell_slots(level)
    # @spell_slots =
    require "pry"; binding.pry
  end

  def find_wizard_spell_slots(level)
    # @spell_slots =
    require "pry"; binding.pry
  end

end
