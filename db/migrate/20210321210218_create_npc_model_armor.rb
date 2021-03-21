class CreateNpcModelArmor < ActiveRecord::Migration[5.2]
  def change
    create_table :npc_model_armors do |t|
      t.references :npc_model, foreign_key: true
      t.references :armor, foreign_key: true

      t.timestamps
    end
  end
end
