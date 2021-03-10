class Stats

  attr_reader :core_stats,
              :saving_throws,
              :skills

  def initialize(ancestry, background, class_data)
    if ancestry[:subraces] != []
      ancestry[:asi] << ancestry[:subraces][0][:asi][0]
    end
    @core_stats = CoreStats.new(ancestry[:asi])
    @saving_throws = SavingThrows.new(modifier(@core_stats), class_data[:prof_saving_throws])
    @skills = Skills.new(modifier(@core_stats), ancestry, background, class_data[:prof_skills])
  end

  def modifier(core_stats)
    require "pry"; binding.pry

  end


end
