class Equipment
  attr_reader :gold,
              :weapons,
              :armor,
              :pack,
              :extras

  def initialize(class_name, background_data, proficiencies)
    @gold = background_data[-1][-5..-1]
    case class_name
    when "Barbarian"
      equip = find_barbarian_equip
    when "Bard"
      equip = find_bard_equip
    when "Cleric"
      equip = find_cleric_equip(proficiencies)
    when "Druid"
      equip = find_druid_equip
    when "Monk"
      equip = find_monk_equip
    when "Fighter"
      equip = find_fighter_equip
    when "Paladin"
      equip = find_paladin_equip
    when "Ranger"
      equip = find_ranger_equip
    when "Rogue"
      equip = find_rogue_equip
    when "Sorcerer"
      equip = find_sorcerer_equip
    when "Warlock"
      equip = find_warlock_equip
    when "Wizard"
      equip = find_wizard_equip
    end
    @weapons = equip[:weapons]
    @armor = equip[:armor]
    @pack = equip[:pack]
    @extras = equip[:extras]
  end

  def find_barbarian_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_bard_equip
    equip = {}
require "pry"; binding.pry
    equip
  end

  def find_cleric_equip(proficiencies)
    equip = {weapons: [Weapon.where(classification: "Simple Melee Weapon").or(Weapon.where(classification: "Simple Ranged Weapon")).sample], armor: [Armor.where(name: "Shield")[0]]}
    unless proficiencies.weapons.downcase.include?("martial")
      equip[:weapons] << Weapon.where(name: "Mace")[0]
    else
      equip[:weapons] << Weapon.where(name: "Mace").or(Weapon.where(name: "Warhammer")).sample
    end
    unless proficiencies.armor.downcase.include?("heavy")
      equip[:armor] << Armor.where(name: "Scale mail").or(Armor.where(name: "Leather")).sample
    else
      equip[:armor] << Armor.where(name: "Scale mail").or(Armor.where(name: "Leather").or(Armor.where(name: "Chain mail"))).sample
    end
    equip[:pack] = Pack.where(name: "Explorer's Pack").or(Pack.where(name: "Priest’s Pack")).sample
    equip[:extras] = "A holy symbol"
    equip
  end

  def find_druid_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_monk_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_fighter_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_paladin_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_ranger_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_rogue_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_sorcerer_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_warlock_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

  def find_wizard_equip
    equip = {}
# require "pry"; binding.pry
    equip
  end

end
