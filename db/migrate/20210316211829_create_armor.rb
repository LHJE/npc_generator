class CreateArmor < ActiveRecord::Migration[5.2]
  def change
    create_table :armors do |t|
      t.string :classification
      t.string :name
      t.string :cost
      t.string :armor_class
      t.string :strength
      t.string :stealth
      t.string :weight

      t.timestamps
    end
  end
end
