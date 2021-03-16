require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CSV.foreach('app/assets/data/weapons.csv', headers: true, header_converters: :symbol) do |data|
  Weapon.create(classification: data[:classification], name: data[:name], cost: data[:cost], damage: data[:damage], weight: data[:weight], properties: data[:properties])
end

CSV.foreach('app/assets/data/armor.csv', headers: true, header_converters: :symbol) do |data|
  Armor.create(classification: data[:classification], name: data[:name], cost: data[:cost], armor_class: data[:armor_class], strength: data[:strength], stealth: data[:stealth], weight: data[:weight])
end
