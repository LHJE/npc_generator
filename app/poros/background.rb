class Background
  attr_reader :name,
              :skill_proficiency_one,
              :skill_proficiency_two,
              :tool_proficiency_one,
              :tool_proficiency_two,
              :extra_languages,
              :equipment,
              :personality

  def initialize(data)
    @name                  = data[:background]
    @skill_proficiency_one = data[:skill_proficiency_one]
    @skill_proficiency_two = data[:skill_proficiency_two]
    @tool_proficiency_one  = data[:tool_proficiency_one]
    @tool_proficiency_two  = data[:tool_proficiency_two]
    @extra_languages       = data[:extra_languages]
    @equipment             = data[:equipment].split(' - ')
    @personality           = find_personality(data[:personality], data[:ideal], data[:bond], data[:flaw])
  end

  def find_personality(personality, ideal, bond, flaw)
    { personality: personality.sub('~', ',').split(' - ').sample, ideal: ideal.sub('~', ',').split(' - ').sample,
      bond: bond.sub('~', ',').split(' - ').sample, flaw: flaw.sub('~', ',').split(' - ').sample }
  end
end
