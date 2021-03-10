class Stats

  attr_reader :core_stats,
              :saving_throws,
              :skills

  def initialize(ancestry, background, class_data)
    if ancestry[:subraces] != []
      ancestry[:asi] << ancestry[:subraces][0][:asi][0]
    end
    @core_stats = CoreStats.new(ancestry[:asi])
    @saving_throws = SavingThrows.new(modifier(@core_stats), class_data[:prof_saving_throws].split(", "))
    @skills = Skills.new(modifier(@core_stats), ancestry, background, class_data[:prof_skills])
  end

  def modifier(core_stats)
    core_stats.stats.each do |attr, score|
      if score < 10
        if score == 1
          core_stats.stats[attr] = -5
        elsif score == 2 || score == 3
          core_stats.stats[attr] = -4
        elsif score == 4 || score == 5
          core_stats.stats[attr] = -3
        elsif score == 6 || score == 7
          core_stats.stats[attr] = -2
        elsif score == 8 || score == 9
          core_stats.stats[attr] = -1
        end
      elsif score < 20
        if score == 10 || score == 11
          core_stats.stats[attr] = 0
        elsif score == 12 || score == 13
          core_stats.stats[attr] = 1
        elsif score == 14 || score == 15
          core_stats.stats[attr] = 2
        elsif score == 16 || score == 17
          core_stats.stats[attr] = 3
        elsif score == 18 || score == 19
          core_stats.stats[attr] = 4
        end
      else
        if score == 20 || score == 21
          core_stats.stats[attr] = 5
        elsif score == 22 || score == 23
          core_stats.stats[attr] = 6
        elsif score == 24 || score == 25
          core_stats.stats[attr] = 7
        elsif score == 26 || score == 27
          core_stats.stats[attr] = 8
        elsif score == 28 || score == 29
          core_stats.stats[attr] = 9
        elsif score == 30
          core_stats.stats[attr] = 10
        end
      end
    end
    core_stats
  end


end
