class AddColumnsToNpcModelThree < ActiveRecord::Migration[5.2]
  def change
    add_column :npc_models, :dex_attack, :integer
    add_column :npc_models, :str_attack, :integer
    add_column :npc_models, :proficiency_bonus, :string
  end
end
