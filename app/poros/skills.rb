class Skills

  attr_reader :skills,
              :proficiencies

  def initialize(core_stats, background_profs, class_profs)
    @skills = {}
    @proficiencies = []
    @proficiencies << background_profs
    background_profs.each do |background_prof|
      class_profs.sub!(background_prof, '')
    end
    (@proficiencies << find_proficiencies(class_profs)).flatten!
    set_base_skill_scores(core_stats)
    adjust_for_profs(@proficiencies)
  end

  def find_proficiencies(class_profs)
    if class_profs[0..16] == "choose two skills"
      class_profs.sub('choose two skills from ', "").sub(' and', '').split(', ').reject(&:empty?).sample(2)
    elsif class_profs[0..14] == "choose two from"
      class_profs.sub('choose two from ', "").sub(' and', '').split(', ').reject(&:empty?).sample(2)
    elsif class_profs[0..11] == "choose three"
      class_profs.sub('choose three from ', "").sub(' and', '').split(', ').reject(&:empty?).sample(3)
    elsif class_profs[0..17] == "choose four skills"
      class_profs.sub('choose four skills from ', "").sub(' and', '').split(', ').reject(&:empty?).sample(4)
    elsif class_profs[0..15] == "choose four from"
      class_profs.sub('choose four from ', "").sub(' and', '').split(', ').reject(&:empty?).sample(4)
    end
  end

  def set_base_skill_scores(core_stats)
    @skills[:acrobatics] = core_stats[:dex]
    @skills[:animal_handling] = core_stats[:wis]
    @skills[:arcana] = core_stats[:int]
    @skills[:athletics] = core_stats[:str]
    @skills[:deception] = core_stats[:cha]
    @skills[:history] = core_stats[:int]
    @skills[:insight] = core_stats[:wis]
    @skills[:intimidation] = core_stats[:cha]
    @skills[:investigation] = core_stats[:int]
    @skills[:medicine] = core_stats[:wis]
    @skills[:nature] = core_stats[:int]
    @skills[:perception] = core_stats[:wis]
    @skills[:performance] = core_stats[:cha]
    @skills[:persuasion] = core_stats[:cha]
    @skills[:religion] = core_stats[:int]
    @skills[:sleight_of_hand] = core_stats[:dex]
    @skills[:stealth] = core_stats[:dex]
    @skills[:survival] = core_stats[:wis]
  end

  def adjust_for_profs(profs)
    profs.each do |prof|
      if prof == "acrobatics"
        @skills[:acrobatics] += 2
      elsif prof == "animal handling"
        @skills[:animal_handling] += 2
      elsif prof == "arcana"
        @skills[:arcana] += 2
      elsif prof == "athletics"
        @skills[:athletics] += 2
      elsif prof == "deception"
        @skills[:deception] += 2
      elsif prof == "history"
        @skills[:history] += 2
      elsif prof == "insight"
        @skills[:insight] += 2
      elsif prof == "intimidation"
        @skills[:intimidation] += 2
      elsif prof == "investigation"
        @skills[:investigation] += 2
      elsif prof == "medicine"
        @skills[:medicine] += 2
      elsif prof == "nature"
        @skills[:nature] += 2
      elsif prof == "perception"
        @skills[:perception] += 2
      elsif prof == "performance"
        @skills[:performance] += 2
      elsif prof == "persuasion"
        @skills[:persuasion] += 2
      elsif prof == "religion"
        @skills[:religion] += 2
      elsif prof == "sleight of hand"
        @skills[:sleight_of_hand] += 2
      elsif prof == "stealth"
        @skills[:stealth] += 2
      elsif prof == "survival"
        @skills[:survival] += 2
      end
    end
  end


end
