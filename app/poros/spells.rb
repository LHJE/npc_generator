class Spells
  attr_reader :all_spells,
              :current_spells,
              :spell_slots

  def initialize(character_class, level, class_table, archetype)
    @spell_slots = {}
    @current_spells = []
    if %w[Druid Wizard].include?(character_class)
      simple_spells(character_class, level, class_table)
    elsif character_class == 'Bard'
      bard_spells(character_class, level, class_table)
    elsif character_class == 'Cleric'
      cleric_spells(character_class, level, class_table)
    elsif character_class == 'Sorcerer'
      sorcerer_spells(character_class, level, class_table)
    elsif character_class == 'Warlock'
      warlock_spells(character_class, level, class_table)
    elsif character_class == 'Paladin'
      paladin_spells(character_class, level, class_table)
    elsif character_class == 'Ranger'
      ranger_spells(character_class, level, class_table)
    elsif character_class == 'Rogue' && archetype.class != String && archetype[:name] == 'Arcane Trickster' || character_class == 'Fighter' && archetype.class != String && archetype[:name] == 'Eldritch Knight'
      # This will have to be updated when the arcane trickster and eldritch kngith archetypes have actually been added to the API.  But for testing purposes I've added this in in this way.
      archetype_spells('Wizard', level, archetype[:name])
    else
      @all_spells = 'Not a spellcaster'
      @current_spells = 'Not a spellcaster'
      @spell_slots = 'Not a spellcaster'
    end
  end

  def simple_spells(character_class, level, class_table)
    @all_spells = Spell.where('classes LIKE ?', "%#{character_class}%")
    find_spells(level, class_table, 'simple')
  end

  def paladin_spells(character_class, level, class_table)
    @all_spells = Spell.where('classes LIKE ?', "%#{character_class}%")
    find_spells(level, class_table, 'paladin')
  end

  def ranger_spells(character_class, level, class_table)
    @all_spells = Spell.where('classes LIKE ?', "%#{character_class}%")
    find_spells(level, class_table, 'ranger')
  end

  def bard_spells(character_class, level, class_table)
    @all_spells = Spell.where('classes LIKE ?', "%#{character_class}%")
    if [1, 2, 5, 9, 10, 13, 15, 17].include?(level)
      find_spells(level, class_table, 'bard_adjusted')
    else
      find_spells(level, class_table, 'bard')
    end
  end

  def cleric_spells(character_class, level, class_table)
    @all_spells = Spell.where('classes LIKE ?', "%#{character_class}%")
    if [2, 6, 8, 11, 14, 17, 18].include?(level)
      find_spells(level, class_table, 'extra_number')
    elsif level == 5
      find_spells(level, class_table, 'cleric_five')
    else
      find_spells(level, class_table, 'simple')
    end
  end

  def archetype_spells(character_class, level, archetype)
    @all_spells = Spell.where('classes LIKE ?', "%#{character_class}%")
    determine_archetype_spells(level, archetype)
  end

  def sorcerer_spells(character_class, level, class_table)
    @all_spells = Spell.where('classes LIKE ?', "%#{character_class}%")
    if level == 1
      find_spells(level, class_table, 'sorcerer_one')
    else
      find_spells(level, class_table, 'sorcerer_higher')
    end
  end

  def warlock_spells(character_class, level, class_table)
    @all_spells = Spell.where('classes LIKE ?', "%#{character_class}%")
    if [11, 13, 15, 17].include?(level)
      find_spells(level, class_table, 'warlock_adjusted')
    else
      find_spells(level, class_table, 'warlock_normal')
    end
  end

  def find_spells(level, class_table, tag)
    class_table.each do |row|
      if row.scan(/\d+/)[0].to_i == level
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
      @spell_slots[spell_level] = row.scan(/\d+/)[2].to_i
      row.scan(/\d+/)[4..-1].each do |number|
        spell_level += 1
        @spell_slots[spell_level] = number.to_i
      end
    when 'bard_adjusted'
      @spell_slots[spell_level] = row.scan(/\d+/)[3].to_i
      row.scan(/\d+/)[5..-1].each do |number|
        spell_level += 1
        @spell_slots[spell_level] = number.to_i
      end
    when 'extra_number'
      row.scan(/\d+/)[3..-1].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'cleric_five'
      row.scan(/\d+/)[4..-1].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'paladin'
      row.scan(/\d+/)[2..-1].flatten.each do |number|
        spell_level += 1
        @spell_slots[spell_level] = number.to_i
      end
    when 'ranger'
      if row.scan(/\d+/)[3..-1].nil?
        @spell_slots = {}
      else
        row.scan(/\d+/)[3..-1].flatten.each do |number|
          spell_level += 1
          @spell_slots[spell_level] = number.to_i
        end
      end
    when 'sorcerer_one'
      # Point of fact, this doesn't EXACTLY match the rules, but it's close, and can be refactored in the future
      [row.scan(/\d+/)[2], row.scan(/\d+/)[4..-1]].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'sorcerer_higher'
      # Point of fact, this doesn't EXACTLY match the rules, but it's close, and can be refactored in the future
      [row.scan(/\d+/)[3], row.scan(/\d+/)[5..-1]].flatten.each do |number|
        @spell_slots[spell_level] = number.to_i
        spell_level += 1
      end
    when 'warlock_normal'
      # Also not exactly how it works, but this works for now and can be refactored
      @spell_slots[spell_level] = row.scan(/\d+/)[2].to_i
      @spell_slots[row.scan(/\d+/)[-2].to_i] = row.scan(/\d+/)[4].to_i
    when 'warlock_adjusted'
      @spell_slots[spell_level] = row.scan(/\d+/)[3].to_i
      @spell_slots[row.scan(/\d+/)[-2].to_i] = row.scan(/\d+/)[5].to_i
    end
  end

  def find_current_spells
    @spell_slots.each do |slot, spells|
      @current_spells << @all_spells.where(level: slot).sample(spells)
    end
  end

  def determine_archetype_spells(level, archetype)
    if level == 3
      @spell_slots = { 0 => 3, 1 => 2 }
    elsif [4, 5, 6].include?(level)
      @spell_slots = { 0 => 3, 1 => 3 }
    elsif level == 7
      @spell_slots = { 0 => 3, 1 => 4, 2 => 2 }
    elsif [8, 9].include?(level)
      @spell_slots = { 0 => 3, 1 => 4, 2 => 2 }
    elsif level == 10
      @spell_slots = { 0 => 4, 1 => 4, 2 => 3 }
    elsif [11, 12].include?(level)
      @spell_slots = { 0 => 4, 1 => 4, 2 => 3 }
    elsif level == 13
      @spell_slots = { 0 => 4, 1 => 4, 2 => 3, 3 => 2 }
    elsif [14, 15].include?(level)
      @spell_slots = { 0 => 4, 1 => 4, 2 => 3, 3 => 2 }
    elsif [16, 17, 18].include?(level)
      @spell_slots = { 0 => 4, 1 => 4, 2 => 3, 3 => 3 }
    elsif [19, 20].include?(level)
      @spell_slots = { 0 => 4, 1 => 4, 2 => 3, 3 => 3, 4 => 1 }
    end
    @spell_slots[0] -= 1 if archetype == 'Eldritch Knight'
    find_current_spells
  end
end
