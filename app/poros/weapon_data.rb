class WeaponData
  attr_reader :classification,
              :name,
              :cost,
              :damage,
              :weight,
              :properties

  def initialize(data)
    @classification = data[:classification]
    @name = data[:name]
    @cost = data[:cost]
    @damage = data[:damage]
    @weight = data[:weight]
    @properties = data[:properties]
  end
end
