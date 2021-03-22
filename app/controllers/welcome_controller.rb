class WelcomeController < ApplicationController
  def index
    if !params[:post].nil?
      base_info = NPCFacade.create_npc(params[:post][:score_type].downcase)
      if current_user.nil?
        @npc = base_info
      else
        @npc = NpcModel.create(alignment: base_info.alignment,
                        ancestry: base_info.ancestry,
                        armor_class: base_info.armor_class,
                        background_equipment: base_info.background.equipment.to_s,
                        background_extra_languages: base_info.background.extra_languages,
                        background_name: base_info.background.name,
                        background_personality_personality: base_info.background.personality[:personality],
                        background_personality_ideal: base_info.background.personality[:ideal],
                        background_personality_bond: base_info.background.personality[:bond],
                        background_personality_flaw: base_info.background.personality[:flaw],
                        background_skill_proficiency_one: base_info.background.skill_proficiency_one,
                        background_skill_proficiency_two: base_info.background.skill_proficiency_two,
                        background_tool_proficiency_one: base_info.background.tool_proficiency_one,
                        background_tool_proficiency_two: base_info.background.tool_proficiency_two,
                        character_class: base_info.character_class,
                        equipment_extras: base_info.equipment.extras,
                        equipment_gold: base_info.equipment.gold,
                        gender: base_info.gender,
                        hit_dice: base_info.hit_dice,
                        initiative: base_info.initiative,
                        languages: base_info.languages.to_s,
                        name: base_info.name,
                        proficiencies_armor: base_info.proficiencies.armor,
                        proficiencies_weapons: base_info.proficiencies.weapons,
                        proficiencies_tools: base_info.proficiencies.tools,
                        size: base_info.size,
                        speed: base_info.speed,
                        stats_core_stats_stats_modifiers_str_mod: base_info.stats.core_stats.stats[:modifiers][:str_mod],
                        stats_core_stats_stats_modifiers_dex_mod: base_info.stats.core_stats.stats[:modifiers][:dex_mod],
                        stats_core_stats_stats_modifiers_con_mod: base_info.stats.core_stats.stats[:modifiers][:con_mod],
                        stats_core_stats_stats_modifiers_int_mod: base_info.stats.core_stats.stats[:modifiers][:int_mod],
                        stats_core_stats_stats_modifiers_wis_mod: base_info.stats.core_stats.stats[:modifiers][:wis_mod],
                        stats_core_stats_stats_modifiers_cha_mod: base_info.stats.core_stats.stats[:modifiers][:cha_mod],
                        stats_core_stats_stats_scores_str: base_info.stats.core_stats.stats[:scores][:str],
                        stats_core_stats_stats_scores_dex: base_info.stats.core_stats.stats[:scores][:dex],
                        stats_core_stats_stats_scores_con: base_info.stats.core_stats.stats[:scores][:con],
                        stats_core_stats_stats_scores_int: base_info.stats.core_stats.stats[:scores][:int],
                        stats_core_stats_stats_scores_wis: base_info.stats.core_stats.stats[:scores][:wis],
                        stats_core_stats_stats_scores_cha: base_info.stats.core_stats.stats[:scores][:cha],
                        stats_hit_points: base_info.stats.hit_points,
                        stats_passive_perception: base_info.stats.passive_perception,
                        stats_saving_throws_throws_str: base_info.stats.saving_throws.throws[:str],
                        stats_saving_throws_throws_dex: base_info.stats.saving_throws.throws[:dex],
                        stats_saving_throws_throws_con: base_info.stats.saving_throws.throws[:con],
                        stats_saving_throws_throws_int: base_info.stats.saving_throws.throws[:int],
                        stats_saving_throws_throws_wis: base_info.stats.saving_throws.throws[:wis],
                        stats_saving_throws_throws_cha: base_info.stats.saving_throws.throws[:cha],
                        stats_skills_proficiencies: base_info.stats.skills.proficiencies.to_s,
                        stats_skills_acrobatics: base_info.stats.skills.skills[:acrobatics],
                        stats_skills_animal_handling: base_info.stats.skills.skills[:animal_handling],
                        stats_skills_arcana: base_info.stats.skills.skills[:arcana],
                        stats_skills_athletics: base_info.stats.skills.skills[:athletics],
                        stats_skills_deception: base_info.stats.skills.skills[:deception],
                        stats_skills_history: base_info.stats.skills.skills[:history],
                        stats_skills_insight: base_info.stats.skills.skills[:insight],
                        stats_skills_intimidation: base_info.stats.skills.skills[:intimidation],
                        stats_skills_investigation: base_info.stats.skills.skills[:investigation],
                        stats_skills_medicine: base_info.stats.skills.skills[:medicine],
                        stats_skills_nature: base_info.stats.skills.skills[:nature],
                        stats_skills_perception: base_info.stats.skills.skills[:perception],
                        stats_skills_performance: base_info.stats.skills.skills[:performance],
                        stats_skills_persuasion: base_info.stats.skills.skills[:persuasion],
                        stats_skills_religion: base_info.stats.skills.skills[:religion],
                        stats_skills_sleight_of_hand: base_info.stats.skills.skills[:sleight_of_hand],
                        stats_skills_stealth: base_info.stats.skills.skills[:stealth],
                        stats_skills_survival: base_info.stats.skills.skills[:survival],
                        sub_ancestry: base_info.sub_ancestry.class == String ? base_info.sub_ancestry : base_info.sub_ancestry[:name],
                        traits: base_info.traits.to_s,
                        vision: base_info.vision,
                        is_saved: 0)
        NpcModelPack.create(npc_model_id: @npc.id, pack_id: base_info.equipment.pack.id)
        base_info.equipment.armor.each do |piece|
          NpcModelArmor.create(npc_model_id: @npc.id, armor_id: piece.id) unless piece == ""
        end
        base_info.equipment.weapons.each do |weapon|
          NpcModelWeapon.create(npc_model_id: @npc.id, weapon_id: weapon.id)
        end
        @armor = base_info.equipment.armor
        @pack = [base_info.equipment.pack]
        @weapons = base_info.equipment.weapons
      end
    end
  end
end
