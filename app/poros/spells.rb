class Spells
  attr_reader :all_spells,
              :current_spells,
              :spell_slots

  def initialize(character_class, level, class_table)
    @spell_slots = {}
    @current_spells = []
    if character_class == 'Druid' || character_class == 'Paladin' || character_class == 'Ranger' || character_class == 'Wizard' ||
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_spells(level, class_table, 'simple')
    elsif character_class == 'Bard'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      if level == "1" || level == "2" || level == "5" || level == "9" || level == "10" || level == "13" || level == "15" || level == "17"
        require "pry"; binding.pry
        find_spells(level, class_table, 'bard')
      else
        find_spells(level, class_table, 'simple')
      end
    elsif character_class == 'Cleric'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      if level == "2" || level == "6" || level == "8" || level == "11" || level == "14" || level == "17" || level == "18"
        find_spells(level, class_table, 'cleric')
      elsif level == "5"
        find_spells(level, class_table, 'cleric_five')
      else
        find_spells(level, class_table, 'simple')
      end
    elsif character_class == 'Sorcerer'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_spells(level, class_table, 'sorcerer')
    elsif character_class == 'Warlock'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      if level == "11" || level == "13" || level == "15" || level == "17"
        find_spells(level, class_table, 'warlock_adjusted')
      else
        find_spells(level, class_table, 'warlock_normal')
      end
      # the below is for the future
    # elsif character_class == 'Rogue' && archetype == 'Arcane Trickster'
    #   @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
    #     find_spells(level, class_table, 'rogue')
    else
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    end
  end

  def find_spells(level, class_table, tag)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        find_spell_slots(row, tag)
        find_current_spells
      end
    end
  end

  def find_spell_slots(row, tag)
    spell_level = 0
    case tag
    when 'simple'
      row.scan(/\d+/)[2..-1].each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'bard'
      require "pry"; binding.pry
      [].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'cleric'
      require "pry"; binding.pry
      [].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'cleric_five'
      require "pry"; binding.pry
      [].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'sorcerer'
      # Point of fact, this doesn't EXACTLY match the rules, but it's close, and can be refactored in the future
      [row.scan(/\d+/)[2], row.scan(/\d+/)[4..-1]].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'warlock_normal'
      require "pry"; binding.pry
      [].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'warlock_adjusted'
      require "pry"; binding.pry
      [].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    end
  end

  def find_current_spells
    @spell_slots.each do |slot, spells|
      @current_spells << @all_spells.where(level: slot).sample(spells)
    end
    @current_spells
  end


end
