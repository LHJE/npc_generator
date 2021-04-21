require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
NpcModelArmor.destroy_all
NpcModelPack.destroy_all
NpcModelWeapon.destroy_all
NpcModelSpell.destroy_all
UserNpcModel.destroy_all
NpcModel.destroy_all
Weapon.destroy_all
Armor.destroy_all
Pack.destroy_all
Spell.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('npcmodelarmors')
ActiveRecord::Base.connection.reset_pk_sequence!('npcmodelpacks')
ActiveRecord::Base.connection.reset_pk_sequence!('npcmodelweapons')
ActiveRecord::Base.connection.reset_pk_sequence!('npcmodelspells')
ActiveRecord::Base.connection.reset_pk_sequence!('usernpcmodels')
ActiveRecord::Base.connection.reset_pk_sequence!('npcmodels')
ActiveRecord::Base.connection.reset_pk_sequence!('weapons')
ActiveRecord::Base.connection.reset_pk_sequence!('armors')
ActiveRecord::Base.connection.reset_pk_sequence!('packs')
ActiveRecord::Base.connection.reset_pk_sequence!('spells')

CSV.foreach('app/assets/data/weapons.csv', headers: true, header_converters: :symbol) do |data|
  Weapon.create(classification: data[:classification], name: data[:name], cost: data[:cost], damage: data[:damage], weight: data[:weight], properties: data[:properties])
end

CSV.foreach('app/assets/data/armor.csv', headers: true, header_converters: :symbol) do |data|
  Armor.create(classification: data[:classification], name: data[:name], cost: data[:cost], armor_class: data[:armor_class], strength: data[:strength], stealth: data[:stealth], weight: data[:weight])
end

CSV.foreach('app/assets/data/packs.csv', headers: true, header_converters: :symbol) do |data|
  Pack.create(name: data[:name], things: data[:things])
end

spells = NPCService.get_spells
spells.each do |spell|
  spell_info = NPCService.get_spell_info(spell[:url][4..-1])
  Spell.create!(name: spell_info[:name],
                description: spell_info[:desc].join(", ").sub(".,", "."),
                higher_level: spell_info[:higher_level].nil? ? spell_info[:higher_level].to_s : spell_info[:higher_level][0].to_s,
                range: spell_info[:range],
                components: spell_info[:components].join(", "),
                material: spell_info[:material],
                ritual: spell_info[:ritual],
                duration: spell_info[:duration],
                concentration: spell_info[:concentration],
                casting_time: spell_info[:casting_time],
                level: spell_info[:level],
                attack_type: spell_info[:attack_type],
                damage_type: spell_info[:damage].nil? || spell_info[:damage][:damage_type].nil? ? "" : spell_info[:damage][:damage_type][:name],
                damage_at_character_level: spell_info[:damage].nil? || spell_info[:damage][:damage_at_character_level].nil? ? "" : (spell_info[:damage][:damage_at_character_level].map { |level, slot| "#{level} => #{slot}"}).join(", "),
                damage_at_slot_level: spell_info[:damage].nil? || spell_info[:damage][:damage_at_slot_level].nil? ? "" : (spell_info[:damage][:damage_at_slot_level].map { |level, slot| "#{level} => #{slot}"}).join(", "),
                school: spell_info[:school][:name].to_s,
                classes: (spell_info[:classes].map { |class_info| class_info[:name] }).join(", "),
                subclasses: (spell_info[:subclasses].map { |class_info| class_info[:name] }).join(", "))
end
