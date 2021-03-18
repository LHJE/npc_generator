class Stats
  attr_reader :core_stats,
              :saving_throws,
              :skills,
              :passive_perception,
              :hit_points

  def initialize(ancestry, sub_ancestry, background, class_data, score_type, traits)
    # The line below will have to be updated once more subraces are created
    ancestry[:asi] << sub_ancestry[:asi][0] if sub_ancestry != 'No Sub Ancestry'
    @core_stats = CoreStats.new(ancestry[:asi], score_type)
    @saving_throws = SavingThrows.new(modifier(@core_stats), class_data[:prof_saving_throws].split(', '))
    @skills = Skills.new(modifier(@core_stats),
                         [background.skill_proficiency_one[0..-7].downcase,
                          background.skill_proficiency_two[0..-7].downcase], class_data[:prof_skills].downcase, traits)
    @passive_perception = @skills.skills[:perception] + 10
    @hit_points = modifier(@core_stats)[:con] + class_data[:hp_at_1st_level].scan(/\d+/)[0].to_i
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
    if [3].include?(score)
      stats[attr] = -4
    elsif [4, 5].include?(score)
      stats[attr] = -3
    elsif [6, 7].include?(score)
      stats[attr] = -2
    elsif [8, 9].include?(score)
      stats[attr] = -1
    end
  end

  def score_below_twenty(stats, attr, score)
    if [10, 11].include?(score)
      stats[attr] = 0
    elsif [12, 13].include?(score)
      stats[attr] = 1
    elsif [14, 15].include?(score)
      stats[attr] = 2
    elsif [16, 17].include?(score)
      stats[attr] = 3
    elsif [18, 19].include?(score)
      stats[attr] = 4
    end
  end

  def score_below_thirty(stats, attr, score)
    if [20, 21].include?(score)
      stats[attr] = 5
    elsif [22, 23].include?(score)
      stats[attr] = 6
    elsif [24, 25].include?(score)
      stats[attr] = 7
    elsif [26, 27].include?(score)
      stats[attr] = 8
    elsif [28, 29].include?(score)
      stats[attr] = 9
    elsif score == 30
      stats[attr] = 10
    end
  end
end
