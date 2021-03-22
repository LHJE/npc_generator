class CreateNpcModelPack < ActiveRecord::Migration[5.2]
  def change
    create_table :npc_model_packs do |t|
      t.references :npc_model, foreign_key: true
      t.references :pack, foreign_key: true

      t.timestamps
    end
  end
end
