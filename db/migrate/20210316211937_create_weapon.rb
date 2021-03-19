class CreateWeapon < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :classification
      t.string :name
      t.string :cost
      t.string :damage
      t.string :weight
      t.string :properties

      t.timestamps
    end
  end
end
