class SavingThrows
  attr_reader :throws

  def initialize(core_stats, class_profs)
    class_profs.each do |prof|
      case prof
      when 'Strength'
        core_stats[:str] += 2
      when 'Dexterity'
        core_stats[:dex] += 2
      when 'Constitution'
        core_stats[:con] += 2
      when 'Intelligence'
        core_stats[:int] += 2
      when 'Wisdom'
        core_stats[:wis] += 2
      when 'Charisma'
        core_stats[:cha] += 2
      end
    end
    @throws = core_stats
  end
end
