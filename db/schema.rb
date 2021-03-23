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

ActiveRecord::Schema.define(version: 2021_03_23_163132) do

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
    t.string "background_tool_proficiency_one"
    t.string "background_tool_proficiency_two"
    t.string "character_class"
    t.string "equipment_extras"
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
    t.string "sub_ancestry"
    t.string "traits"
    t.string "vision"
    t.integer "is_saved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.string "personality_personality"
    t.string "personality_ideal"
    t.string "personality_bond"
    t.string "personality_flaw"
    t.string "skill_proficiency_one"
    t.string "skill_proficiency_two"
    t.string "tool_proficiency_one"
    t.string "tool_proficiency_two"
    t.string "gold"
    t.string "core_modifiers_str_mod"
    t.string "core_modifiers_dex_mod"
    t.string "core_modifiers_con_mod"
    t.string "core_modifiers_int_mod"
    t.string "core_modifiers_wis_mod"
    t.string "core_modifiers_cha_mod"
    t.string "core_scores_str"
    t.string "core_scores_dex"
    t.string "core_scores_con"
    t.string "core_scores_int"
    t.string "core_scores_wis"
    t.string "core_scores_cha"
    t.string "hit_points"
    t.string "passive_perception"
    t.string "saving_throws_str"
    t.string "saving_throws_dex"
    t.string "saving_throws_con"
    t.string "saving_throws_int"
    t.string "saving_throws_wis"
    t.string "saving_throws_cha"
    t.string "skills_proficiencies"
    t.string "skills_acrobatics"
    t.string "skills_animal_handling"
    t.string "skills_arcana"
    t.string "skills_athletics"
    t.string "skills_deception"
    t.string "skills_history"
    t.string "skills_insight"
    t.string "skills_intimidation"
    t.string "skills_investigation"
    t.string "skills_medicine"
    t.string "skills_nature"
    t.string "skills_perception"
    t.string "skills_performance"
    t.string "skills_persuasion"
    t.string "skills_religion"
    t.string "skills_sleight_of_hand"
    t.string "skills_stealth"
    t.string "skills_survival"
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
