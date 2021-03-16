class Proficiencies
  attr_reader :armor,
              :weapons,
              :tools

  def initialize(class_data)
    @armor = class_data[:prof_armor]
    @weapons = class_data[:prof_weapons]
    @tools = class_data[:prof_tools]
  end
end
