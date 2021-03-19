class CoreStats
  attr_reader :stats

  def initialize(ancestry_buffs, score_type)
    @stats = { modifiers: { str_mod: 0, dex_mod: 0, con_mod: 0, int_mod: 0, wis_mod: 0, cha_mod: 0 },
               scores: { str: 0, dex: 0, con: 0, int: 0, wis: 0, cha: 0 } }
    distribute_scores(score_type)
    distribute_buffs(ancestry_buffs)
    modifier
  end

  def distribute_scores(score_type)
    scores = determine_scores(score_type)
    @stats[:scores][:str] = scores[0]
    @stats[:scores][:dex] = scores[1]
    @stats[:scores][:con] = scores[2]
    @stats[:scores][:int] = scores[3]
    @stats[:scores][:wis] = scores[4]
    @stats[:scores][:cha] = scores[5]
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
        @stats[:scores][:str] += buff[:value]
      when 'Dexterity'
        @stats[:scores][:dex] += buff[:value]
      when 'Constitution'
        @stats[:scores][:con] += buff[:value]
      when 'Intelligence'
        @stats[:scores][:int] += buff[:value]
      when 'Wisdom'
        @stats[:scores][:wis] += buff[:value]
      when 'Charisma'
        @stats[:scores][:cha] += buff[:value]
      end
    end
  end

  def modifier
    @stats[:scores].each do |attr, score|
      if score < 10
        score_below_ten(attr, score)
      elsif score < 20
        score_below_twenty(attr, score)
      else
        score_below_thirty(attr, score)
      end
    end
  end

  def score_below_ten(attr, score)
    if [3].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = -4
    elsif [4, 5].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = -3
    elsif [6, 7].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = -2
    elsif [8, 9].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = -1
    end
  end

  def score_below_twenty(attr, score)
    if [10, 11].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 0
    elsif [12, 13].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 1
    elsif [14, 15].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 2
    elsif [16, 17].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 3
    elsif [18, 19].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 4
    end
  end

  def score_below_thirty(attr, score)
    if [20, 21].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 5
    elsif [22, 23].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 6
    elsif [24, 25].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 7
    elsif [26, 27].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 8
    elsif [28, 29].include?(score)
      @stats[:modifiers]["#{attr}_mod".to_sym] = 9
    elsif score == 30
      @stats[:modifiers]["#{attr}_mod".to_sym] = 10
    end
  end
end
