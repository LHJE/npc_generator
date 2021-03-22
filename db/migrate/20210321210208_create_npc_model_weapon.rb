class CreateNpcModelWeapon < ActiveRecord::Migration[5.2]
  def change
    create_table :npc_model_weapons do |t|
      t.references :npc_model, foreign_key: true
      t.references :weapon, foreign_key: true

      t.timestamps
    end
  end
end
