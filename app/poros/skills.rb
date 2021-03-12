class Skills
  attr_reader :skills,
              :proficiencies

  def initialize(core_stats, background_profs, class_profs)
    @skills = {}
    @proficiencies = []
    @proficiencies << background_profs
    remove_background_profs(background_profs, class_profs)
    (@proficiencies << find_proficiencies(background_profs, class_profs)).flatten!
    set_base_skill_scores(core_stats)
    adjust_for_profs(@proficiencies)
  end

  def find_proficiencies(background_profs, class_profs)
    choice_texts = ['choose two skills from ',
                    'choose two from ',
                    'choose three from ',
                    'choose four skills from ',
                    'choose four from ']
    if class_profs[0..22] == choice_texts[0]
      process_profs(class_profs, choice_texts[0], 2)
    elsif class_profs[0..15] == choice_texts[1]
      process_profs(class_profs, choice_texts[1], 2)
    elsif class_profs[0..17] == choice_texts[2]
      process_profs(class_profs, choice_texts[2], 3)
    elsif class_profs[0..16] == 'choose any three'
      all_profs = 'acrobatics,
                  animal_handling,
                  arcana,
                  athletics,
                  deception,
                  history,
                  insight,
                  intimidation,
                  investigation,
                  medicine,
                  nature,
                  perception,
                  performance,
                  persuasion,
                  religion,
                  sleight_of_hand,
                  stealth,
                  survival'
      remove_background_profs(background_profs, all_profs)
      process_profs(all_profs, '...', 3)
    elsif class_profs[0..23] == choice_texts[3]
      process_profs(class_profs, choice_texts[3], 4)
    elsif class_profs[0..16] == choice_texts[4]
      process_profs(class_profs, choice_texts[4], 4)
      class_profs.sub(choice_texts[4], '').sub(' and', '').split(', ').reject(&:empty?).sample(4)
    end
  end

  def process_profs(profs, text, sample_number)
    profs.sub(text, '').sub(' and', '').split(', ').reject(&:empty?).sample(sample_number)
  end

  def remove_background_profs(background_profs, other_profs)
    background_profs.each do |background_prof|
      other_profs.sub!(background_prof, '')
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
      case prof
      when 'acrobatics'
        @skills[:acrobatics] += 2
      when 'animal handling'
        @skills[:animal_handling] += 2
      when 'arcana'
        @skills[:arcana] += 2
      when 'athletics'
        @skills[:athletics] += 2
      when 'deception'
        @skills[:deception] += 2
      when 'history'
        @skills[:history] += 2
      when 'insight'
        @skills[:insight] += 2
      when 'intimidation'
        @skills[:intimidation] += 2
      when 'investigation'
        @skills[:investigation] += 2
      when 'medicine'
        @skills[:medicine] += 2
      when 'nature'
        @skills[:nature] += 2
      when 'perception'
        @skills[:perception] += 2
      when 'performance'
        @skills[:performance] += 2
      when 'persuasion'
        @skills[:persuasion] += 2
      when 'religion'
        @skills[:religion] += 2
      when 'sleight of hand'
        @skills[:sleight_of_hand] += 2
      when 'stealth'
        @skills[:stealth] += 2
      when 'survival'
        @skills[:survival] += 2
      end
    end
  end
end
