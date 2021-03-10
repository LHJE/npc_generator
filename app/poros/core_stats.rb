class CoreStats

attr_reader :stats

  def initialize(ancestry_buffs)
    @stats = {}
    distribute_scores
    distribute_buffs(ancestry_buffs)
  end

  def distribute_scores
    scores = [15,14,13,12,10,8].shuffle
    @stats[:str] = scores[0]
    @stats[:dex] = scores[1]
    @stats[:con] = scores[2]
    @stats[:int] = scores[3]
    @stats[:wis] = scores[4]
    @stats[:cha] = scores[5]
  end

  def distribute_buffs(ancestry_buffs)
    ancestry_buffs.each do |buff|
      if buff[:attributes][0] == "Strength"
        @stats[:str] += buff[:value]
      elsif buff[:attributes][0] == "Dexterity"
        @stats[:dex] += buff[:value]
      elsif buff[:attributes][0] == "Constitution"
        @stats[:con] += buff[:value]
      elsif buff[:attributes][0] == "Intelligence"
        @stats[:int] += buff[:value]
      elsif buff[:attributes][0] == "Wisdom"
        @stats[:wis] += buff[:value]
      elsif buff[:attributes][0] == "Charisma"
        @stats[:cha] += buff[:value]
      end
    end
  end

end
