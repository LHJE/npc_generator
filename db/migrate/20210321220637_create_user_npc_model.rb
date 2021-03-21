class CreateUserNpcModel < ActiveRecord::Migration[5.2]
  def change
    create_table :user_npc_models do |t|
      t.references :npc_model, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
