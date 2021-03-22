class CreateNpcModel < ActiveRecord::Migration[5.2]
  def change
    create_table :npc_models do |t|
      t.string :alignment
      t.string :ancestry
      t.string :armor_class
      t.string :background_equipment
      t.string :background_extra_languages
      t.string :background_name
      t.string :background_personality_personality
      t.string :background_personality_ideal
      t.string :background_personality_bond
      t.string :background_personality_flaw
      t.string :background_skill_proficiency_one
      t.string :background_skill_proficiency_two
      t.string :background_tool_proficiency_one
      t.string :background_tool_proficiency_two
      t.string :character_class
      t.string :equipment_extras
      t.string :equipment_gold
      t.string :gender
      t.string :hit_dice
      t.string :initiative
      t.string :languages
      t.string :name
      t.string :proficiencies_armor
      t.string :proficiencies_weapons
      t.string :proficiencies_tools
      t.string :size
      t.string :speed
      t.string :stats_core_stats_stats_modifiers_str_mod
      t.string :stats_core_stats_stats_modifiers_dex_mod
      t.string :stats_core_stats_stats_modifiers_con_mod
      t.string :stats_core_stats_stats_modifiers_int_mod
      t.string :stats_core_stats_stats_modifiers_wis_mod
      t.string :stats_core_stats_stats_modifiers_cha_mod
      t.string :stats_core_stats_stats_scores_str
      t.string :stats_core_stats_stats_scores_dex
      t.string :stats_core_stats_stats_scores_con
      t.string :stats_core_stats_stats_scores_int
      t.string :stats_core_stats_stats_scores_wis
      t.string :stats_core_stats_stats_scores_cha
      t.string :stats_hit_points
      t.string :stats_passive_perception
      t.string :stats_saving_throws_throws_str
      t.string :stats_saving_throws_throws_dex
      t.string :stats_saving_throws_throws_con
      t.string :stats_saving_throws_throws_int
      t.string :stats_saving_throws_throws_wis
      t.string :stats_saving_throws_throws_cha
      t.string :stats_skills_proficiencies
      t.string :stats_skills_acrobatics
      t.string :stats_skills_animal_handling
      t.string :stats_skills_arcana
      t.string :stats_skills_athletics
      t.string :stats_skills_deception
      t.string :stats_skills_history
      t.string :stats_skills_insight
      t.string :stats_skills_intimidation
      t.string :stats_skills_investigation
      t.string :stats_skills_medicine
      t.string :stats_skills_nature
      t.string :stats_skills_perception
      t.string :stats_skills_performance
      t.string :stats_skills_persuasion
      t.string :stats_skills_religion
      t.string :stats_skills_sleight_of_hand
      t.string :stats_skills_stealth
      t.string :stats_skills_survival
      t.string :sub_ancestry
      t.string :traits
      t.string :vision
      t.integer :is_saved

      t.timestamps
    end
  end
end
