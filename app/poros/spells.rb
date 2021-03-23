class Spells
  attr_reader :all_spells,
              :current_spells,
              :spell_slots

  def initialize(character_class, level, class_table)
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
      find_bard_spells(level, class_table)
    when 'Cleric'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_cleric_spells(level, class_table)
    when 'Druid'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_druid_spells(level, class_table)
    when 'Paladin'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_paladin_spells(level, class_table)
    when 'Ranger'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_ranger_spells(level, class_table)
    when 'Sorcerer'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_sorcerer_spells(level, class_table)
    when 'Warlock'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_warlock_spells(level, class_table)
    when 'Wizard'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_wizard_spells(level, class_table)
    end
  end

  def find_bard_spells(level, class_table)
    case level
    when 1
      # @spell_slots =
      # @current_spells =
      require "pry"; binding.pry
    when 2
      # @spell_slots =
      # @current_spells =
    when 3
      # @spell_slots =
      # @current_spells =
    when 4
      # @spell_slots =
      # @current_spells =
    when 5
      # @spell_slots =
      # @current_spells =
    when 6
      # @spell_slots =
      # @current_spells =
    when 7
      # @spell_slots =
      # @current_spells =
    when 8
      # @spell_slots =
      # @current_spells =
    when 9
      # @spell_slots =
      # @current_spells =
    when 10
      # @spell_slots =
      # @current_spells =
    when 11
      # @spell_slots =
      # @current_spells =
    when 12
      # @spell_slots =
      # @current_spells =
    when 13
      # @spell_slots =
      # @current_spells =
    when 14
      # @spell_slots =
      # @current_spells =
    when 15
      # @spell_slots =
      # @current_spells =
    when 16
      # @spell_slots =
      # @current_spells =
    when 17
      # @spell_slots =
      # @current_spells =
    when 18
      # @spell_slots =
      # @current_spells =
    when 19
      # @spell_slots =
      # @current_spells =
    when 20
      # @spell_slots =
      # @current_spells =
    end
  end

  def find_cleric_spells(level, class_table)
    case level
    when 1
      @spell_slots = ["cantrips => 3", "1st => 2"]
      # @current_spells =
      require "pry"; binding.pry
    when 2
      @spell_slots = ["cantrips => 3", "1st => 3"]
      # @current_spells =
    when 3
      @spell_slots = ["cantrips => 3", "1st => 4", "2nd => 2"]
      # @current_spells =
    when 4
      @spell_slots = ["cantrips => 3", "1st => 4", "2nd => 3"]
      # @current_spells =
    when 5
      @spell_slots = ["cantrips => 4", "1st => 4", "2nd => 3", "3rd => 2"]
      # @current_spells =
    when 6
      @spell_slots = ["cantrips => 4", "1st => 4", "2nd => 3", "3rd => 3"]
      # @current_spells =
    when 7
      @spell_slots = ["cantrips => 4", "1st => 4", "2nd => 3", "3rd => 3", "4th => 1"]
      # @current_spells =
    when 8
      @spell_slots = ["cantrips => 4", "1st => 4", "2nd => 3", "3rd => 3", "4th => 1"]
      # @current_spells =
    when 9
      # @spell_slots =
      # @current_spells =
    when 10
      # @spell_slots =
      # @current_spells =
    when 11
      # @spell_slots =
      # @current_spells =
    when 12
      # @spell_slots =
      # @current_spells =
    when 13
      # @spell_slots =
      # @current_spells =
    when 14
      # @spell_slots =
      # @current_spells =
    when 15
      # @spell_slots =
      # @current_spells =
    when 16
      # @spell_slots =
      # @current_spells =
    when 17
      # @spell_slots =
      # @current_spells =
    when 18
      # @spell_slots =
      # @current_spells =
    when 19
      # @spell_slots =
      # @current_spells =
    when 20
      # @spell_slots =
      # @current_spells =
    end
  end

  def find_druid_spells(level, class_table)
    case level
    when 1
      # @spell_slots =
      # @current_spells =
      require "pry"; binding.pry
    when 2
      # @spell_slots =
      # @current_spells =
    when 3
      # @spell_slots =
      # @current_spells =
    when 4
      # @spell_slots =
      # @current_spells =
    when 5
      # @spell_slots =
      # @current_spells =
    when 6
      # @spell_slots =
      # @current_spells =
    when 7
      # @spell_slots =
      # @current_spells =
    when 8
      # @spell_slots =
      # @current_spells =
    when 9
      # @spell_slots =
      # @current_spells =
    when 10
      # @spell_slots =
      # @current_spells =
    when 11
      # @spell_slots =
      # @current_spells =
    when 12
      # @spell_slots =
      # @current_spells =
    when 13
      # @spell_slots =
      # @current_spells =
    when 14
      # @spell_slots =
      # @current_spells =
    when 15
      # @spell_slots =
      # @current_spells =
    when 16
      # @spell_slots =
      # @current_spells =
    when 17
      # @spell_slots =
      # @current_spells =
    when 18
      # @spell_slots =
      # @current_spells =
    when 19
      # @spell_slots =
      # @current_spells =
    when 20
      # @spell_slots =
      # @current_spells =
    end
  end

  def find_paladin_spells(level, class_table)
    case level
    when 1
      # @spell_slots =
      # @current_spells =
      require "pry"; binding.pry
    when 2
      # @spell_slots =
      # @current_spells =
    when 3
      # @spell_slots =
      # @current_spells =
    when 4
      # @spell_slots =
      # @current_spells =
    when 5
      # @spell_slots =
      # @current_spells =
    when 6
      # @spell_slots =
      # @current_spells =
    when 7
      # @spell_slots =
      # @current_spells =
    when 8
      # @spell_slots =
      # @current_spells =
    when 9
      # @spell_slots =
      # @current_spells =
    when 10
      # @spell_slots =
      # @current_spells =
    when 11
      # @spell_slots =
      # @current_spells =
    when 12
      # @spell_slots =
      # @current_spells =
    when 13
      # @spell_slots =
      # @current_spells =
    when 14
      # @spell_slots =
      # @current_spells =
    when 15
      # @spell_slots =
      # @current_spells =
    when 16
      # @spell_slots =
      # @current_spells =
    when 17
      # @spell_slots =
      # @current_spells =
    when 18
      # @spell_slots =
      # @current_spells =
    when 19
      # @spell_slots =
      # @current_spells =
    when 20
      # @spell_slots =
      # @current_spells =
    end
  end

  def find_ranger_spells(level, class_table)
    case level
    when 1
      # @spell_slots =
      # @current_spells =
      require "pry"; binding.pry
    when 2
      # @spell_slots =
      # @current_spells =
    when 3
      # @spell_slots =
      # @current_spells =
    when 4
      # @spell_slots =
      # @current_spells =
    when 5
      # @spell_slots =
      # @current_spells =
    when 6
      # @spell_slots =
      # @current_spells =
    when 7
      # @spell_slots =
      # @current_spells =
    when 8
      # @spell_slots =
      # @current_spells =
    when 9
      # @spell_slots =
      # @current_spells =
    when 10
      # @spell_slots =
      # @current_spells =
    when 11
      # @spell_slots =
      # @current_spells =
    when 12
      # @spell_slots =
      # @current_spells =
    when 13
      # @spell_slots =
      # @current_spells =
    when 14
      # @spell_slots =
      # @current_spells =
    when 15
      # @spell_slots =
      # @current_spells =
    when 16
      # @spell_slots =
      # @current_spells =
    when 17
      # @spell_slots =
      # @current_spells =
    when 18
      # @spell_slots =
      # @current_spells =
    when 19
      # @spell_slots =
      # @current_spells =
    when 20
      # @spell_slots =
      # @current_spells =
    end
  end

  def find_sorcerer_spells(level, class_table)
    case level
    when 1
      # @spell_slots =
      # @current_spells =
      require "pry"; binding.pry
    when 2
      # @spell_slots =
      # @current_spells =
    when 3
      # @spell_slots =
      # @current_spells =
    when 4
      # @spell_slots =
      # @current_spells =
    when 5
      # @spell_slots =
      # @current_spells =
    when 6
      # @spell_slots =
      # @current_spells =
    when 7
      # @spell_slots =
      # @current_spells =
    when 8
      # @spell_slots =
      # @current_spells =
    when 9
      # @spell_slots =
      # @current_spells =
    when 10
      # @spell_slots =
      # @current_spells =
    when 11
      # @spell_slots =
      # @current_spells =
    when 12
      # @spell_slots =
      # @current_spells =
    when 13
      # @spell_slots =
      # @current_spells =
    when 14
      # @spell_slots =
      # @current_spells =
    when 15
      # @spell_slots =
      # @current_spells =
    when 16
      # @spell_slots =
      # @current_spells =
    when 17
      # @spell_slots =
      # @current_spells =
    when 18
      # @spell_slots =
      # @current_spells =
    when 19
      # @spell_slots =
      # @current_spells =
    when 20
      # @spell_slots =
      # @current_spells =
    end
  end

  def find_warlock_spells(level, class_table)
    case level
    when 1
      # @spell_slots =
      # @current_spells =
      require "pry"; binding.pry
    when 2
      # @spell_slots =
      # @current_spells =
    when 3
      # @spell_slots =
      # @current_spells =
    when 4
      # @spell_slots =
      # @current_spells =
    when 5
      # @spell_slots =
      # @current_spells =
    when 6
      # @spell_slots =
      # @current_spells =
    when 7
      # @spell_slots =
      # @current_spells =
    when 8
      # @spell_slots =
      # @current_spells =
    when 9
      # @spell_slots =
      # @current_spells =
    when 10
      # @spell_slots =
      # @current_spells =
    when 11
      # @spell_slots =
      # @current_spells =
    when 12
      # @spell_slots =
      # @current_spells =
    when 13
      # @spell_slots =
      # @current_spells =
    when 14
      # @spell_slots =
      # @current_spells =
    when 15
      # @spell_slots =
      # @current_spells =
    when 16
      # @spell_slots =
      # @current_spells =
    when 17
      # @spell_slots =
      # @current_spells =
    when 18
      # @spell_slots =
      # @current_spells =
    when 19
      # @spell_slots =
      # @current_spells =
    when 20
      # @spell_slots =
      # @current_spells =
    end
  end

  def find_wizard_spells(level, class_table)
    case level
    when 1
      # @spell_slots =
      # @current_spells =
      require "pry"; binding.pry
    when 2
      # @spell_slots =
      # @current_spells =
    when 3
      # @spell_slots =
      # @current_spells =
    when 4
      # @spell_slots =
      # @current_spells =
    when 5
      # @spell_slots =
      # @current_spells =
    when 6
      # @spell_slots =
      # @current_spells =
    when 7
      # @spell_slots =
      # @current_spells =
    when 8
      # @spell_slots =
      # @current_spells =
    when 9
      # @spell_slots =
      # @current_spells =
    when 10
      # @spell_slots =
      # @current_spells =
    when 11
      # @spell_slots =
      # @current_spells =
    when 12
      # @spell_slots =
      # @current_spells =
    when 13
      # @spell_slots =
      # @current_spells =
    when 14
      # @spell_slots =
      # @current_spells =
    when 15
      # @spell_slots =
      # @current_spells =
    when 16
      # @spell_slots =
      # @current_spells =
    when 17
      # @spell_slots =
      # @current_spells =
    when 18
      # @spell_slots =
      # @current_spells =
    when 19
      # @spell_slots =
      # @current_spells =
    when 20
      # @spell_slots =
      # @current_spells =
    end
  end

end
