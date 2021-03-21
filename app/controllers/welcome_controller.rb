class WelcomeController < ApplicationController
  def index
    if !params[:post].nil?
      @npc = NPCFacade.create_npc(params[:post][:score_type].downcase) unless params[:post].nil?

      # require "pry"; binding.pry

      session[:npc_alignment] = @npc.alignment
      session[:npc_ancestry] = @npc.ancestry
      session[:npc_armor_class] = @npc.armor_class
      session[:npc_background_equipment] = @npc.background.equipment.to_s
      session[:npc_background_extra_languages] = @npc.background.extra_languages
      session[:npc_background_name] = @npc.background.name
      session[:npc_background_personality_personality] = @npc.background.personality[:personality]
      session[:npc_background_personality_ideal] = @npc.background.personality[:ideal]
      session[:npc_background_personality_bond] = @npc.background.personality[:bond]
      session[:npc_background_personality_flaw] = @npc.background.personality[:flaw]
      session[:npc_background_skill_proficiency_one] = @npc.background.skill_proficiency_one
      session[:npc_background_skill_proficiency_two] = @npc.background.skill_proficiency_two
      session[:npc_background_tool_proficiency_one] = @npc.background.tool_proficiency_one
      session[:npc_background_tool_proficiency_two] = @npc.background.tool_proficiency_two
      session[:npc_class] = @npc.class
      session[:npc_armor_ids] = @npc.equipment.armor.each do |piece|
        piece.id
      end.to_s
      session[:npc_equipment_extras] = @npc.equipment.extras
      session[:npc_equipment_gold] = @npc.equipment.gold
      session[:npc_pack_id] = @npc.equipment.pack.id
      session[:npc_weapons_ids] = @npc.equipment.weapons.map do |weapon|
        weapon.id
      end.to_s
      session[:npc_gender] = @npc.gender
      session[:npc_hit_dice] = @npc.hit_dice
      session[:npc_initiative] = @npc.initiative
      session[:npc_languages] = @npc.languages.to_s
      session[:npc_name] = @npc.name
      session[:npc_proficiencies_armor] = @npc.proficiencies.armor
      session[:npc_proficiencies_weapons] = @npc.proficiencies.weapons
      session[:npc_proficiencies_tools] = @npc.proficiencies.tools
      session[:npc_size] = @npc.size
      session[:npc_speed] = @npc.speed
      session[:npc_stats_core_stats_stats_modifiers_str_mod] = @npc.stats.core_stats.stats[:modifiers][:str_mod]
      session[:npc_stats_core_stats_stats_modifiers_dex_mod] = @npc.stats.core_stats.stats[:modifiers][:dex_mod]
      session[:npc_stats_core_stats_stats_modifiers_con_mod] = @npc.stats.core_stats.stats[:modifiers][:con_mod]
      session[:npc_stats_core_stats_stats_modifiers_int_mod] = @npc.stats.core_stats.stats[:modifiers][:int_mod]
      session[:npc_stats_core_stats_stats_modifiers_wis_mod] = @npc.stats.core_stats.stats[:modifiers][:wis_mod]
      session[:npc_stats_core_stats_stats_modifiers_cha_mod] = @npc.stats.core_stats.stats[:modifiers][:cha_mod]
      session[:npc_stats_core_stats_stats_scores_str] = @npc.stats.core_stats.stats[:scores][:str]
      session[:npc_stats_core_stats_stats_scores_dex] = @npc.stats.core_stats.stats[:scores][:dex]
      session[:npc_stats_core_stats_stats_scores_con] = @npc.stats.core_stats.stats[:scores][:con]
      session[:npc_stats_core_stats_stats_scores_int] = @npc.stats.core_stats.stats[:scores][:int]
      session[:npc_stats_core_stats_stats_scores_wis] = @npc.stats.core_stats.stats[:scores][:wis]
      session[:npc_stats_core_stats_stats_scores_cha] = @npc.stats.core_stats.stats[:scores][:cha]
      session[:npc_stats_hit_points] = @npc.stats.hit_points
      session[:npc_stats_passive_perception] = @npc.stats.passive_perception
      session[:npc_stats_saving_throws_throws_str] = @npc.stats.saving_throws.throws[:str]
      session[:npc_stats_saving_throws_throws_dex] = @npc.stats.saving_throws.throws[:dex]
      session[:npc_stats_saving_throws_throws_con] = @npc.stats.saving_throws.throws[:con]
      session[:npc_stats_saving_throws_throws_int] = @npc.stats.saving_throws.throws[:int]
      session[:npc_stats_saving_throws_throws_wis] = @npc.stats.saving_throws.throws[:wis]
      session[:npc_stats_saving_throws_throws_cha] = @npc.stats.saving_throws.throws[:cha]
      session[:npc_stats_skills_proficiencies] = @npc.stats.skills.proficiencies.to_s
      session[:npc_stats_skills_acrobatics] = @npc.stats.skills.skills[:acrobatics]
      session[:npc_stats_skills_animal_handling] = @npc.stats.skills.skills[:animal_handling]
      session[:npc_stats_skills_arcana] = @npc.stats.skills.skills[:arcana]
      session[:npc_stats_skills_athletics] = @npc.stats.skills.skills[:athletics]
      session[:npc_stats_skills_deception] = @npc.stats.skills.skills[:deception]
      session[:npc_stats_skills_history] = @npc.stats.skills.skills[:history]
      session[:npc_stats_skills_insight] = @npc.stats.skills.skills[:insight]
      session[:npc_stats_skills_intimidation] = @npc.stats.skills.skills[:intimidation]
      session[:npc_stats_skills_investigation] = @npc.stats.skills.skills[:investigation]
      session[:npc_stats_skills_medicine] = @npc.stats.skills.skills[:medicine]
      session[:npc_stats_skills_nature] = @npc.stats.skills.skills[:nature]
      session[:npc_stats_skills_perception] = @npc.stats.skills.skills[:perception]
      session[:npc_stats_skills_performance] = @npc.stats.skills.skills[:performance]
      session[:npc_stats_skills_persuasion] = @npc.stats.skills.skills[:persuasion]
      session[:npc_stats_skills_religion] = @npc.stats.skills.skills[:religion]
      session[:npc_stats_skills_sleight_of_hand] = @npc.stats.skills.skills[:sleight_of_hand]
      session[:npc_stats_skills_stealth] = @npc.stats.skills.skills[:stealth]
      session[:npc_stats_skills_survival] = @npc.stats.skills.skills[:survival]
      session[:npc_sub_ancestry] = @npc.sub_ancestry
      session[:npc_traits] = @npc.traits.to_s
      session[:npc_vision] = @npc.vision
    end
  end
end
