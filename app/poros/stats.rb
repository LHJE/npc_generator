class Stats
  attr_reader :core_stats,
              :saving_throws,
              :skills,
              :passive_perception,
              :hit_points,
              :proficiency_bonus

  def initialize(ancestry, sub_ancestry, background, class_data, score_type, traits, level)
    @proficiency_bonus = 2
    if level > 3
      leveled_stats = level_up(level)
    end
    ancestry[:asi] << sub_ancestry[:asi].sample if sub_ancestry != 'No Sub Ancestry'
    @core_stats = CoreStats.new(ancestry[:asi], score_type, leveled_stats)
    @saving_throws = SavingThrows.new(@core_stats.stats[:modifiers], class_data[:prof_saving_throws].split(', '))
    @skills = Skills.new(@core_stats.stats[:modifiers],
                         [background.skill_proficiency_one[0..-7].downcase,
                          background.skill_proficiency_two[0..-7].downcase], class_data[:prof_skills].downcase, traits, @proficiency_bonus)
    @passive_perception = @skills.skills[:perception] + 10
    @hit_points = @core_stats.stats[:modifiers][:con_mod] + class_data[:hp_at_1st_level].scan(/\d+/)[0].to_i
    if level > 1
      level.times do
        @hit_points += @core_stats.stats[:modifiers][:con_mod] + class_data[:hp_at_higher_levels].scan(/\d+/)[2].to_i
      end
    end
  end

  def level_up(level)
    if level == 4
      level_stats_determiner(2)
    elsif [5, 6, 7].include?(level)
      @proficiency_bonus = 3
      level_stats_determiner(2)
    elsif level == 8
      @proficiency_bonus = 3
      level_stats_determiner(4)
    elsif [9, 10, 11].include?(level)
      @proficiency_bonus = 4
      level_stats_determiner(4)
    elsif level == 12
      @proficiency_bonus = 4
      level_stats_determiner(6)
    elsif [13, 14, 15].include?(level)
      @proficiency_bonus = 5
      level_stats_determiner(6)
    elsif level == 16
      @proficiency_bonus = 5
      level_stats_determiner(8)
    elsif [17, 18, 19, 20].include?(level)
      @proficiency_bonus = 6
      level_stats_determiner(8)
    end
  end

  def level_stats_determiner(number)
    stats = number.times.map { %w[str dex con int wis cha].sample }
    leveled_stats = { str: 0, dex: 0, con: 0, int: 0, wis: 0, cha: 0 }
    stats.map do |stat|
      leveled_stats["#{stat}".to_sym] += 1
    end
    leveled_stats
  end
end
