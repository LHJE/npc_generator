class Skills
  attr_reader :skills,
              :proficiencies

  def initialize(core_stats, background_profs, class_profs, traits)
    @skills = set_base_skill_scores(core_stats)
    @proficiencies = [background_profs]
    remove_background_profs(background_profs, class_profs)
    (@proficiencies << find_proficiencies(background_profs, class_profs)).flatten!
    (@proficiencies << find_trait_proficiencies).flatten! unless traits.nil?
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
    { acrobatics: core_stats[:dex], animal_handling: core_stats[:wis], arcana: core_stats[:int],
      athletics: core_stats[:str], deception: core_stats[:cha], history: core_stats[:int], insight: core_stats[:wis], intimidation: core_stats[:cha], investigation: core_stats[:int], medicine: core_stats[:wis], nature: core_stats[:int], perception: core_stats[:wis], performance: core_stats[:cha], persuasion: core_stats[:cha], religion: core_stats[:int], sleight_of_hand: core_stats[:dex], stealth: core_stats[:dex], survival: core_stats[:wis] }
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
