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
    @saving_throws = SavingThrows.new(@core_stats.stats[:modifiers], class_data[:prof_saving_throws].split(', '))
    @skills = Skills.new(@core_stats.stats[:modifiers],
                         [background.skill_proficiency_one[0..-7].downcase,
                          background.skill_proficiency_two[0..-7].downcase], class_data[:prof_skills].downcase, traits)
    @passive_perception = @skills.skills[:perception] + 10
    @hit_points = @core_stats.stats[:modifiers][:con_mod] + class_data[:hp_at_1st_level].scan(/\d+/)[0].to_i
  end
end
