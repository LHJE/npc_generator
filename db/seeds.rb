require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Weapon.destroy_all
Armor.destroy_all
Pack.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('weapons')
ActiveRecord::Base.connection.reset_pk_sequence!('armors')
ActiveRecord::Base.connection.reset_pk_sequence!('packs')

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
  Spell.create!(name: spell_info[:name], description: spell_info[:desc], higher_level: spell_info[:higher_level].to_s, range: spell_info[:range], components: spell_info[:components].to_s, material: spell_info[:material], ritual: spell_info[:ritual], duration: spell_info[:duration], concentration: spell_info[:concentration], casting_time: spell_info[:casting_time], level: spell_info[:level], attack_type: spell_info[:attack_type], damage: spell_info[:damage].to_s, school: spell_info[:school], classes: (spell_info[:classes].map { |class_info| class_info[:name] }))
end
