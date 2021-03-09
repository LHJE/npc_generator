class NPC
  attr_reader :name,
              :ancestry,
              :class

  def initialize(name, ancestry, class_data)
    @name = name[:firstname]+ " " + name[:lastname]
    @ancestry = ancestry
    @class = class_data
  end
end
