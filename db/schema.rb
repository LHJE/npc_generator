# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_003654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armors", force: :cascade do |t|
    t.string "classification"
    t.string "name"
    t.string "cost"
    t.string "armor_class"
    t.string "strength"
    t.string "stealth"
    t.string "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "npc_model_armors", force: :cascade do |t|
    t.bigint "npc_model_id"
    t.bigint "armor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["armor_id"], name: "index_npc_model_armors_on_armor_id"
    t.index ["npc_model_id"], name: "index_npc_model_armors_on_npc_model_id"
  end

  create_table "npc_model_packs", force: :cascade do |t|
    t.bigint "npc_model_id"
    t.bigint "pack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npc_model_id"], name: "index_npc_model_packs_on_npc_model_id"
    t.index ["pack_id"], name: "index_npc_model_packs_on_pack_id"
  end

  create_table "npc_model_weapons", force: :cascade do |t|
    t.bigint "npc_model_id"
    t.bigint "weapon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npc_model_id"], name: "index_npc_model_weapons_on_npc_model_id"
    t.index ["weapon_id"], name: "index_npc_model_weapons_on_weapon_id"
  end

  create_table "npc_models", force: :cascade do |t|
    t.string "alignment"
    t.string "ancestry"
    t.string "armor_class"
    t.string "background_equipment"
    t.string "background_extra_languages"
    t.string "background_name"
    t.string "background_personality_personality"
    t.string "background_personality_ideal"
    t.string "background_personality_bond"
    t.string "background_personality_flaw"
    t.string "background_skill_proficiency_one"
    t.string "background_skill_proficiency_two"
    t.string "background_tool_proficiency_one"
    t.string "background_tool_proficiency_two"
    t.string "character_class"
    t.string "equipment_extras"
    t.string "equipment_gold"
    t.string "gender"
    t.string "hit_dice"
    t.string "initiative"
    t.string "languages"
    t.string "name"
    t.string "proficiencies_armor"
    t.string "proficiencies_weapons"
    t.string "proficiencies_tools"
    t.string "size"
    t.string "speed"
    t.string "stats_core_stats_stats_modifiers_str_mod"
    t.string "stats_core_stats_stats_modifiers_dex_mod"
    t.string "stats_core_stats_stats_modifiers_con_mod"
    t.string "stats_core_stats_stats_modifiers_int_mod"
    t.string "stats_core_stats_stats_modifiers_wis_mod"
    t.string "stats_core_stats_stats_modifiers_cha_mod"
    t.string "stats_core_stats_stats_scores_str"
    t.string "stats_core_stats_stats_scores_dex"
    t.string "stats_core_stats_stats_scores_con"
    t.string "stats_core_stats_stats_scores_int"
    t.string "stats_core_stats_stats_scores_wis"
    t.string "stats_core_stats_stats_scores_cha"
    t.string "stats_hit_points"
    t.string "stats_passive_perception"
    t.string "stats_saving_throws_throws_str"
    t.string "stats_saving_throws_throws_dex"
    t.string "stats_saving_throws_throws_con"
    t.string "stats_saving_throws_throws_int"
    t.string "stats_saving_throws_throws_wis"
    t.string "stats_saving_throws_throws_cha"
    t.string "stats_skills_proficiencies"
    t.string "stats_skills_acrobatics"
    t.string "stats_skills_animal_handling"
    t.string "stats_skills_arcana"
    t.string "stats_skills_athletics"
    t.string "stats_skills_deception"
    t.string "stats_skills_history"
    t.string "stats_skills_insight"
    t.string "stats_skills_intimidation"
    t.string "stats_skills_investigation"
    t.string "stats_skills_medicine"
    t.string "stats_skills_nature"
    t.string "stats_skills_perception"
    t.string "stats_skills_performance"
    t.string "stats_skills_persuasion"
    t.string "stats_skills_religion"
    t.string "stats_skills_sleight_of_hand"
    t.string "stats_skills_stealth"
    t.string "stats_skills_survival"
    t.string "sub_ancestry"
    t.string "traits"
    t.string "vision"
    t.integer "is_saved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packs", force: :cascade do |t|
    t.string "name"
    t.string "things"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "higher_level"
    t.string "range"
    t.string "components"
    t.string "material"
    t.boolean "ritual"
    t.string "duration"
    t.boolean "concentration"
    t.string "casting_time"
    t.integer "level"
    t.string "attack_type"
    t.string "damage_type"
    t.string "damage_at_character_level"
    t.string "damage_at_slot_level"
    t.string "school"
    t.string "classes"
    t.string "subclasses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_npc_models", force: :cascade do |t|
    t.bigint "npc_model_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npc_model_id"], name: "index_user_npc_models_on_npc_model_id"
    t.index ["user_id"], name: "index_user_npc_models_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "classification"
    t.string "name"
    t.string "cost"
    t.string "damage"
    t.string "weight"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "npc_model_armors", "armors"
  add_foreign_key "npc_model_armors", "npc_models"
  add_foreign_key "npc_model_packs", "npc_models"
  add_foreign_key "npc_model_packs", "packs"
  add_foreign_key "npc_model_weapons", "npc_models"
  add_foreign_key "npc_model_weapons", "weapons"
  add_foreign_key "user_npc_models", "npc_models"
  add_foreign_key "user_npc_models", "users"
end
