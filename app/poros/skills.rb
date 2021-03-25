class Skills
  attr_reader :skills,
              :proficiencies

  def initialize(core_stats, background_profs, class_profs, traits, bonus)
    @skills = set_base_skill_scores(core_stats)
    @proficiencies = [background_profs]
    remove_background_profs(background_profs, class_profs)
    (@proficiencies << find_proficiencies(background_profs, class_profs)).flatten!
    (@proficiencies << find_trait_proficiencies).flatten! unless traits.nil?
    adjust_for_profs(@proficiencies, bonus)
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
      all_profs = 'acrobatics, animal handling, arcana, athletics, deception, history, insight, intimidation, investigation, medicine, nature, perception, performance, persuasion, religion, sleight of hand, stealth, survival'
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

  def remove_background_profs(background_profs, class_profs)
    background_profs.each do |background_prof|
      class_profs.sub!(background_prof, '')
    end
  end

  def find_trait_proficiencies
    all_profs = 'acrobatics, animal handling, arcana, athletics, deception, history, insight, intimidation, investigation, medicine, nature, perception, performance, persuasion, religion, sleight of hand, stealth, survival'
    @proficiencies.map do |prof|
      all_profs.sub!(prof, '')
    end
    all_profs.split(', ').reject(&:empty?).sample(2)
  end

  def set_base_skill_scores(core_stats)
    { acrobatics: core_stats[:dex_mod], animal_handling: core_stats[:wis_mod], arcana: core_stats[:int_mod],
      athletics: core_stats[:str_mod], deception: core_stats[:cha_mod], history: core_stats[:int_mod], insight: core_stats[:wis_mod], intimidation: core_stats[:cha_mod], investigation: core_stats[:int_mod], medicine: core_stats[:wis_mod], nature: core_stats[:int_mod], perception: core_stats[:wis_mod], performance: core_stats[:cha_mod], persuasion: core_stats[:cha_mod], religion: core_stats[:int_mod], sleight_of_hand: core_stats[:dex_mod], stealth: core_stats[:dex_mod], survival: core_stats[:wis_mod] }
  end

  def adjust_for_profs(profs, bonus)
    profs.each do |prof|
      case prof
      when 'acrobatics'
        @skills[:acrobatics] += bonus
      when 'animal handling'
        @skills[:animal_handling] += bonus
      when 'arcana'
        @skills[:arcana] += bonus
      when 'athletics'
        @skills[:athletics] += bonus
      when 'deception'
        @skills[:deception] += bonus
      when 'history'
        @skills[:history] += bonus
      when 'insight'
        @skills[:insight] += bonus
      when 'intimidation'
        @skills[:intimidation] += bonus
      when 'investigation'
        @skills[:investigation] += bonus
      when 'medicine'
        @skills[:medicine] += bonus
      when 'nature'
        @skills[:nature] += bonus
      when 'perception'
        @skills[:perception] += bonus
      when 'performance'
        @skills[:performance] += bonus
      when 'persuasion'
        @skills[:persuasion] += bonus
      when 'religion'
        @skills[:religion] += bonus
      when 'sleight of hand'
        @skills[:sleight_of_hand] += bonus
      when 'stealth'
        @skills[:stealth] += bonus
      when 'survival'
        @skills[:survival] += bonus
      end
    end
  end
end
