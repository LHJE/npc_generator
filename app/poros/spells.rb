class Spells
  attr_reader :all_spells,
              :current_spells,
              :spell_slots

  def initialize(character_class, level, class_table)
    @spell_slots = []
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
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots << "#{spell_level} => #{number}"
          spell_level += 1
        end
        require "pry"; binding.pry
      end
    end
  end

  def find_cleric_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots << "#{spell_level} => #{number}"
          spell_level += 1
        end
        require "pry"; binding.pry
      end
    end
  end

  def find_druid_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots << "#{spell_level} => #{number}"
          spell_level += 1
        end
        require "pry"; binding.pry
      end
    end
  end

  def find_paladin_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots << "#{spell_level} => #{number}"
          spell_level += 1
        end
        require "pry"; binding.pry
      end
    end
  end

  def find_ranger_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots << "#{spell_level} => #{number}"
          spell_level += 1
        end
        require "pry"; binding.pry
      end
    end
  end

  def find_sorcerer_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots << "#{spell_level} => #{number}"
          spell_level += 1
        end
        require "pry"; binding.pry
      end
    end
  end

  def find_warlock_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots << "#{spell_level} => #{number}"
          spell_level += 1
        end
        require "pry"; binding.pry
      end
    end
  end

  def find_wizard_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots << "#{spell_level} => #{number}"
          spell_level += 1
        end
        require "pry"; binding.pry
      end
    end
  end

end
