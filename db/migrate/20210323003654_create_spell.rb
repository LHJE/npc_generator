class CreateSpell < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :description
      t.string :higher_level
      t.string :range
      t.string :components
      t.string :material
      t.boolean :ritual
      t.string :duration
      t.boolean :concentration
      t.string :casting_time
      t.integer :level
      t.string :attack_type
      t.string :damage_type
      t.string :damage_at_character_level
      t.string :damage_at_slot_level
      t.string :school
      t.string :classes
      t.string :subclasses

      t.timestamps
    end
  end
end
