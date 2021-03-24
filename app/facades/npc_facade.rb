require 'faker'
class NPCFacade
  def self.create_npc(score_type, level)
    npc_ancestry = NPCService.create_npc_ancestry
    npc_class = NPCService.create_npc_class
    base_info = NPC.new(npc_ancestry, npc_class, score_type, level)
    npc = [NpcModel.create!(alignment: base_info.alignment,
                            ancestry: base_info.ancestry,
                            archetype_name: base_info.archetype.instance_of?(String) ? base_info.archetype : base_info.archetype[:name],
                            archetype_desc: base_info.archetype.instance_of?(String) ? base_info.archetype : base_info.archetype[:desc],
                            armor_class: base_info.armor_class,
                            background_equipment: base_info.background.equipment.to_s,
                            background_extra_languages: base_info.background.extra_languages,
                            background_name: base_info.background.name,
                            personality_personality: base_info.background.personality[:personality],
                            personality_ideal: base_info.background.personality[:ideal],
                            personality_bond: base_info.background.personality[:bond],
                            personality_flaw: base_info.background.personality[:flaw],
                            skill_proficiency_one: base_info.background.skill_proficiency_one,
                            skill_proficiency_two: base_info.background.skill_proficiency_two,
                            background_tool_proficiency_one: base_info.background.tool_proficiency_one,
                            background_tool_proficiency_two: base_info.background.tool_proficiency_two,
                            character_class: base_info.character_class,
                            equipment_extras: base_info.equipment.extras,
                            gold: base_info.equipment.gold,
                            gender: base_info.gender,
                            hit_dice: base_info.hit_dice,
                            initiative: base_info.initiative,
                            languages: base_info.languages,
                            level: base_info.level,
                            name: base_info.name,
                            proficiencies_armor: base_info.proficiencies.armor,
                            proficiencies_weapons: base_info.proficiencies.weapons,
                            proficiencies_tools: base_info.proficiencies.tools,
                            size: base_info.size,
                            speed: base_info.speed,
                            core_modifiers_str_mod: base_info.stats.core_stats.stats[:modifiers][:str_mod],
                            core_modifiers_dex_mod: base_info.stats.core_stats.stats[:modifiers][:dex_mod],
                            core_modifiers_con_mod: base_info.stats.core_stats.stats[:modifiers][:con_mod],
                            core_modifiers_int_mod: base_info.stats.core_stats.stats[:modifiers][:int_mod],
                            core_modifiers_wis_mod: base_info.stats.core_stats.stats[:modifiers][:wis_mod],
                            core_modifiers_cha_mod: base_info.stats.core_stats.stats[:modifiers][:cha_mod],
                            core_scores_str: base_info.stats.core_stats.stats[:scores][:str],
                            core_scores_dex: base_info.stats.core_stats.stats[:scores][:dex],
                            core_scores_con: base_info.stats.core_stats.stats[:scores][:con],
                            core_scores_int: base_info.stats.core_stats.stats[:scores][:int],
                            core_scores_wis: base_info.stats.core_stats.stats[:scores][:wis],
                            core_scores_cha: base_info.stats.core_stats.stats[:scores][:cha],
                            hit_points: base_info.stats.hit_points,
                            passive_perception: base_info.stats.passive_perception,
                            saving_throws_str: base_info.stats.saving_throws.throws[:str],
                            saving_throws_dex: base_info.stats.saving_throws.throws[:dex],
                            saving_throws_con: base_info.stats.saving_throws.throws[:con],
                            saving_throws_int: base_info.stats.saving_throws.throws[:int],
                            saving_throws_wis: base_info.stats.saving_throws.throws[:wis],
                            saving_throws_cha: base_info.stats.saving_throws.throws[:cha],
                            skills_proficiencies: base_info.stats.skills.proficiencies.to_s,
                            skills_acrobatics: base_info.stats.skills.skills[:acrobatics],
                            skills_animal_handling: base_info.stats.skills.skills[:animal_handling],
                            skills_arcana: base_info.stats.skills.skills[:arcana],
                            skills_athletics: base_info.stats.skills.skills[:athletics],
                            skills_deception: base_info.stats.skills.skills[:deception],
                            skills_history: base_info.stats.skills.skills[:history],
                            skills_insight: base_info.stats.skills.skills[:insight],
                            skills_intimidation: base_info.stats.skills.skills[:intimidation],
                            skills_investigation: base_info.stats.skills.skills[:investigation],
                            skills_medicine: base_info.stats.skills.skills[:medicine],
                            skills_nature: base_info.stats.skills.skills[:nature],
                            skills_perception: base_info.stats.skills.skills[:perception],
                            skills_performance: base_info.stats.skills.skills[:performance],
                            skills_persuasion: base_info.stats.skills.skills[:persuasion],
                            skills_religion: base_info.stats.skills.skills[:religion],
                            skills_sleight_of_hand: base_info.stats.skills.skills[:sleight_of_hand],
                            skills_stealth: base_info.stats.skills.skills[:stealth],
                            skills_survival: base_info.stats.skills.skills[:survival],
                            spell_slots: base_info.spells.spell_slots.instance_of?(String) ? base_info.spells.spell_slots : base_info.spells.spell_slots.to_s,
                            sub_ancestry: base_info.sub_ancestry.instance_of?(String) ? base_info.sub_ancestry : base_info.sub_ancestry[:name],
                            traits: base_info.traits.to_s,
                            vision: base_info.vision,
                            is_saved: 0),
           @pack = [base_info.equipment.pack],
           @armor = base_info.equipment.armor,
           @weapons = base_info.equipment.weapons,
           @spells = base_info.spells.current_spells]

    NpcModelPack.create(npc_model_id: npc[0].id, pack_id: @pack[0].id)
    @armor.each do |piece|
      NpcModelArmor.create(npc_model_id: npc[0].id, armor_id: piece.id) unless piece == ''
    end
    @weapons.each do |weapon|
      NpcModelWeapon.create(npc_model_id: npc[0].id, weapon_id: weapon.id)
    end
    if @spells.class != String
      @spells.flatten.each do |spell|
        NpcModelSpell.create(npc_model_id: npc[0].id, spell_id: spell.id) unless spell.nil?
      end
    end
    npc
  end
end
