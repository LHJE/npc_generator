class SavingThrows

  attr_reader :throws

  def initialize(core_stats, class_profs)
    class_profs.each do |prof|
      if prof == "Strength"
        core_stats[:str] += 2
      elsif prof == "Dexterity"
        core_stats[:dex] += 2
      elsif prof == "Constitution"
        core_stats[:con] += 2
      elsif prof == "Intelligence"
        core_stats[:int] += 2
      elsif prof == "Wisdom"
        core_stats[:wis] += 2
      elsif prof == "Charisma"
        core_stats[:cha] += 2
      end
    end
    @throws = core_stats
  end




end
