class ArmorData
  attr_reader :classification,
              :name,
              :cost,
              :armor_class,
              :strength,
              :stealth,
              :weight

  def initialize(data)
    @type = data[:classification]
    @name = data[:name]
    @cost = data[:cost]
    @armor_class = data[:armor_class]
    @strength = data[:strength]
    @stealth = data[:stealth]
    @weight = data[:weight]
  end
end
