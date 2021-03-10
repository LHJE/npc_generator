class Background

  attr_reader :name,
              :skill_proficiency_one,
              :skill_proficiency_two,
              :tool_proficiency_one,
              :tool_proficiency_two,
              :extra_languages

  def initialize(data)
    @name                  = data[:background]
    @skill_proficiency_one = data[:skill_proficiency_one]
    @skill_proficiency_two = data[:skill_proficiency_two]
    @tool_proficiency_one  = data[:tool_proficiency_one]
    @tool_proficiency_two  = data[:tool_proficiency_two]
    @extra_languages       = data[:extra_languages]
  end


end
