class CoreStats
  attr_reader :stats

  def initialize(ancestry_buffs, score_type)
    @stats = {}
    distribute_scores(score_type)
    distribute_buffs(ancestry_buffs)
  end

  def distribute_scores(score_type)
    if score_type == "standard array"
      scores = [15, 14, 13, 12, 10, 8].shuffle
    elsif score_type == "roll for scores"
      scores = roll_scores
    end
    @stats[:str] = scores[0]
    @stats[:dex] = scores[1]
    @stats[:con] = scores[2]
    @stats[:int] = scores[3]
    @stats[:wis] = scores[4]
    @stats[:cha] = scores[5]
  end

  def roll_scores
    scores = []
    6.times do
      (scores << [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].sort.drop(1).sum)
    end
    scores
  end

  def distribute_buffs(ancestry_buffs)
    ancestry_buffs.each do |buff|
      case buff[:attributes][0]
      when 'Strength'
        @stats[:str] += buff[:value]
      when 'Dexterity'
        @stats[:dex] += buff[:value]
      when 'Constitution'
        @stats[:con] += buff[:value]
      when 'Intelligence'
        @stats[:int] += buff[:value]
      when 'Wisdom'
        @stats[:wis] += buff[:value]
      when 'Charisma'
        @stats[:cha] += buff[:value]
      end
    end
  end
end
