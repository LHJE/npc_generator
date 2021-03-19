class SavingThrows
  attr_reader :throws

  def initialize(core_stats, class_profs)
    @throws = { str: core_stats[:str_mod], dex: core_stats[:dex_mod],
                con: core_stats[:con_mod], int: core_stats[:int_mod], wis: core_stats[:wis_mod], cha: core_stats[:cha_mod] }
    class_profs.each do |prof|
      case prof
      when 'Strength'
        @throws[:str] += 2
      when 'Dexterity'
        @throws[:dex] += 2
      when 'Constitution'
        @throws[:con] += 2
      when 'Intelligence'
        @throws[:int] += 2
      when 'Wisdom'
        @throws[:wis] += 2
      when 'Charisma'
        @throws[:cha] += 2
      end
    end

  end
end
