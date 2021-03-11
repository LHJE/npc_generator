class Stats

  attr_reader :core_stats,
              :saving_throws,
              :skills

  def initialize(ancestry, background, class_data)
    if ancestry[:subraces] != [] && !ancestry[:subraces].nil?
      ancestry[:asi] << ancestry[:subraces][0][:asi][0]
    end
    @core_stats = CoreStats.new(ancestry[:asi])
    @saving_throws = SavingThrows.new(modifier(@core_stats), class_data[:prof_saving_throws].split(", "))
    @skills = Skills.new(modifier(@core_stats), [background.skill_proficiency_one[0..-7].downcase, background.skill_proficiency_two[0..-7].downcase], class_data[:prof_skills].downcase)
  end

  def modifier(old_stats)
    stats = {}
    old_stats.stats.each do |attr, score|
      if score < 10
        score_below_ten(stats, attr, score)
      elsif score < 20
        score_below_twenty(stats, attr, score)
      else
        score_below_thirty(stats, attr, score)
      end
    end
    stats
  end

  def score_below_ten(stats, attr, score)
    if score == 1
      stats[attr] = -5
    elsif score == 2 || score == 3
      stats[attr] = -4
    elsif score == 4 || score == 5
      stats[attr] = -3
    elsif score == 6 || score == 7
      stats[attr] = -2
    elsif score == 8 || score == 9
      stats[attr] = -1
    end
  end

  def score_below_twenty(stats, attr, score)
    if score == 10 || score == 11
      stats[attr] = 0
    elsif score == 12 || score == 13
      stats[attr] = 1
    elsif score == 14 || score == 15
      stats[attr] = 2
    elsif score == 16 || score == 17
      stats[attr] = 3
    elsif score == 18 || score == 19
      stats[attr] = 4
    end
  end

  def score_below_thirty(stats, attr, score)
    if score == 20 || score == 21
      stats[attr] = 5
    elsif score == 22 || score == 23
      stats[attr] = 6
    elsif score == 24 || score == 25
      stats[attr] = 7
    elsif score == 26 || score == 27
      stats[attr] = 8
    elsif score == 28 || score == 29
      stats[attr] = 9
    elsif score == 30
      stats[attr] = 10
    end
  end


end
