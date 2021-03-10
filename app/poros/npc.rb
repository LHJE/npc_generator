class NPC
  attr_reader :name,
              :ancestry,
              :class

  def initialize(name, ancestry, class_data)
    @name = "#{name[0]} #{name[1]} #{name[2]}"
    @ancestry = ancestry
    @class = class_data
  end
end
