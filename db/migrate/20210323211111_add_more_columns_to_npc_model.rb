class AddMoreColumnsToNpcModel < ActiveRecord::Migration[5.2]
  def change
    add_column :npc_models, :archetype_name, :string
    add_column :npc_models, :archetype_desc, :string
    add_column :npc_models, :spell_slots, :string
  end
end
