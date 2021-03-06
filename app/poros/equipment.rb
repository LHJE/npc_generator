class Equipment
  attr_reader :gold,
              :weapons,
              :armor,
              :pack,
              :extras

  def initialize(class_name, background_data, proficiencies)
    @gold = background_data[-1][-5..-1]
    case class_name
    when 'Barbarian'
      equip = find_barbarian_equip
    when 'Bard'
      equip = find_bard_equip
    when 'Cleric'
      equip = find_cleric_equip(proficiencies)
    when 'Druid'
      equip = find_druid_equip
    when 'Fighter'
      equip = find_fighter_equip
    when 'Monk'
      equip = find_monk_equip
    when 'Paladin'
      equip = find_paladin_equip
    when 'Ranger'
      equip = find_ranger_equip
    when 'Rogue'
      equip = find_rogue_equip
    when 'Sorcerer'
      equip = find_sorcerer_equip
    when 'Warlock'
      equip = find_warlock_equip
    when 'Wizard'
      equip = find_wizard_equip
    end
    @weapons = equip[:weapons]
    @armor = equip[:armor]
    @pack = equip[:pack]
    @extras = equip[:extras]
  end

  def find_barbarian_equip
    equip = { weapons: [Weapon.where(classification: 'Martial Melee Weapon').or(Weapon.where(name: 'Greataxe')).sample, Weapon.where(name: 'Javelin'), Weapon.where(name: 'Javelin'), Weapon.where(name: 'Javelin'), Weapon.where(name: 'Javelin')].flatten,
              armor: [''],
              pack: Pack.where(name: 'Explorer’s Pack')[0],
              extras: 'None' }
    if [true, false].sample
      equip[:weapons] << Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(classification: 'Simple Ranged Weapon')).sample
    else
      2.times do
        equip[:weapons] << Weapon.where(name: 'Handaxe')[0]
      end
    end
    equip
  end

  def find_bard_equip
    { weapons: [Weapon.where(name: 'Dagger')[0], Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(classification: 'Simple Ranged Weapon').or(Weapon.where(name: 'Longsword').or(Weapon.where(name: 'Rapier')))).sample].flatten,
      armor: [Armor.where(name: 'Leather')[0]],
      pack: Pack.where(name: 'Diplomat’s Pack').or(Pack.where(name: 'Entertainer’s Pack')).sample,
      extras: 'A lute or any other musical instrument' }
  end

  def find_cleric_equip(proficiencies)
    equip = {
      weapons: [Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(classification: 'Simple Ranged Weapon')).sample], armor: [Armor.where(name: 'Shield')[0]], pack: Pack.where(name: "Explorer's Pack").or(Pack.where(name: 'Priest’s Pack')).sample, extras: 'A holy symbol'
    }
    equip[:weapons] << if proficiencies.weapons.downcase.include?('martial')
                         Weapon.where(name: 'Mace').or(Weapon.where(name: 'Warhammer')).sample
                       else
                         Weapon.where(name: 'Mace')[0]
                       end
    if proficiencies.armor.downcase.include?('heavy')
      equip[:armor] << Armor.where(name: 'Scale mail').or(Armor.where(name: 'Leather').or(Armor.where(name: 'Chain mail'))).sample
    else
      equip[:armor] << Armor.where(name: 'Scale mail').or(Armor.where(name: 'Leather')).sample
    end
    equip
  end

  def find_druid_equip
    equip = { weapons: [Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(name: 'Scimitar')).sample].flatten,
              armor: [Armor.where(name: 'Leather')[0]],
              pack: Pack.where(name: 'Explorer’s Pack')[0],
              extras: 'A druidic focus' }
    if [true, false].sample
      equip[:armor] << Armor.where(name: 'Shield')[0]
    else
      equip[:weapons] << Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(classification: 'Simple Ranged Weapon')).sample
    end
    equip
  end

  def find_fighter_equip
    equip = { armor: [], weapons: [], pack: Pack.where(name: 'Explorer’s Pack').or(Pack.where(name: 'Dungeoneer’s Pack')).sample,
              extras: 'None' }
    if [true, false].sample
      equip[:armor] << Armor.where(name: 'Chain mail')[0]
    else
      equip[:armor] << Armor.where(name: 'Leather')[0]
      equip[:weapons] << Weapon.where(name: 'Longbow')[0]
    end
    if [true, false].sample
      2.times do
        equip[:weapons] << Weapon.where(classification: 'Martial Melee Weapon').or(Weapon.where(classification: 'Martial Ranged Weapon')).sample
      end
    else
      equip[:armor] << Armor.where(name: 'Shield')[0]
      equip[:weapons] << Weapon.where(classification: 'Martial Melee Weapon').or(Weapon.where(classification: 'Martial Ranged Weapon')).sample
    end
    if [true, false].sample
      2.times do
        equip[:weapons] << Weapon.where(name: 'Handaxe')[0]
      end
    else
      equip[:weapons] << Weapon.where(name: 'Crossbow light')[0]
    end
    equip
  end

  def find_monk_equip
    { weapons: [Weapon.where(name: 'Dart')[0], Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(classification: 'Simple Ranged Weapon').or(Weapon.where(name: 'Shortsword'))).sample].flatten,
      armor: [''],
      pack: Pack.where(name: 'Explorer’s Pack').or(Pack.where(name: 'Dungeoneer’s Pack')).sample,
      extras: 'None' }
  end

  def find_paladin_equip
    equip = { armor: [Armor.where(name: 'Chain mail')[0]], pack: Pack.where(name: 'Explorer’s Pack').or(Pack.where(name: 'Priest’s Pack')).sample, weapons: [],
              extras: 'A holy symbol' }
    if [true, false].sample
      2.times do
        equip[:weapons] << Weapon.where(classification: 'Martial Melee Weapon').or(Weapon.where(classification: 'Martial Ranged Weapon')).sample
      end
    else
      equip[:armor] << Armor.where(name: 'Shield')[0]
      equip[:weapons] << Weapon.where(classification: 'Martial Melee Weapon').or(Weapon.where(classification: 'Martial Ranged Weapon')).sample
    end
    if [true, false].sample
      5.times do
        equip[:weapons] << Weapon.where(name: 'Javelin')[0]
      end
    else
      equip[:weapons] << Weapon.where(classification: 'Simple Melee Weapon').sample
    end
    equip
  end

  def find_ranger_equip
    equip = { weapons: [Weapon.where(name: 'Longbow')[0]],
              armor: [Armor.where(name: 'Leather').or(Armor.where(name: 'Scale mail')).sample],
              pack: Pack.where(name: 'Explorer’s Pack').or(Pack.where(name: 'Dungeoneer’s Pack')).sample,
              extras: 'None' }
    if [true, false].sample
      2.times do
        equip[:weapons] << Weapon.where(name: 'Shortsword')[0]
      end
    else
      2.times do
        equip[:weapons] << Weapon.where(classification: 'Simple Melee Weapon').sample
      end
    end
    equip
  end

  def find_rogue_equip
    { weapons: [Weapon.where(name: 'Dagger')[0], Weapon.where(name: 'Dagger')[0], Weapon.where(name: 'Rapier').or(Weapon.where(name: 'Shortsword')).sample, Weapon.where(name: 'Shortbow').or(Weapon.where(name: 'Shortsword')).sample],
      armor: [Armor.where(name: 'Leather')[0]],
      pack: Pack.where(name: 'Burglar’s Pack').or(Pack.where(name: 'Dungeoneer’s Pack').or(Pack.where(name: 'Explorer’s Pack'))).sample,
      extras: 'Thieves’ tools' }
  end

  def find_sorcerer_equip
    { weapons: [Weapon.where(name: 'Dagger')[0], Weapon.where(name: 'Dagger')[0], Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(classification: 'Simple Ranged Weapon').or(Weapon.where(name: 'Crossbow light'))).sample].flatten,
      armor: [''],
      pack: Pack.where(name: 'Explorer’s Pack').or(Pack.where(name: 'Dungeoneer’s Pack')).sample,
      extras: ['A component pouch', 'An arcane focus'].sample.to_s }
  end

  def find_warlock_equip
    { weapons: [Weapon.where(name: 'Dagger')[0], Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(classification: 'Simple Ranged Weapon').or(Weapon.where(name: 'Crossbow light'))).sample, Weapon.where(classification: 'Simple Melee Weapon').or(Weapon.where(classification: 'Simple Ranged Weapon')).sample].flatten,
      armor: [Armor.where(name: 'Leather')[0]],
      pack: Pack.where(name: 'Scholar’s Pack').or(Pack.where(name: 'Dungeoneer’s Pack')).sample,
      extras: ['A component pouch', 'An arcane focus'].sample.to_s }
  end

  def find_wizard_equip
    { weapons: [Weapon.where(name: 'Quarterstaff').or(Weapon.where(name: 'Dagger')).sample],
      armor: [''],
      pack: Pack.where(name: 'Scholar’s Pack').or(Pack.where(name: 'Explorer’s Pack')).sample,
      extras: "A spellbook, #{['A component pouch', 'An arcane focus'].sample}" }
  end
end
