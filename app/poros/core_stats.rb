class CoreStats
  attr_reader :stats

  def initialize(ancestry_buffs, score_type)
    @stats = {}
    distribute_scores(score_type)
    distribute_buffs(ancestry_buffs)
  end

  def distribute_scores(score_type)
    scores = determine_scores(score_type)
    @stats[:str] = scores[0]
    @stats[:dex] = scores[1]
    @stats[:con] = scores[2]
    @stats[:int] = scores[3]
    @stats[:wis] = scores[4]
    @stats[:cha] = scores[5]
  end

  def determine_scores(score_type)
    case score_type
    when 'standard array'
      scores = [15, 14, 13, 12, 10, 8].shuffle
    when 'roll for scores'
      scores = roll_scores
    when 'min/maxed point buy'
      scores = [8, 8, 8, 15, 15, 15].shuffle
    when 'wildly unbalanced'
      scores = [3, 3, 3, 20, 20, 20].shuffle
    end
    scores
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
