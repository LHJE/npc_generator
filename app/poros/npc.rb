class NPC
  attr_reader :name,
              :ancestry,
              :class

  def initialize(name, ancestry, class_data)
    @name = "#{name[:firstname][:name]} #{name[:lastname][:name]}"
    @ancestry = ancestry
    @class = class_data
  end
end
