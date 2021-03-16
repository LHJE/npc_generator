class CreatePack < ActiveRecord::Migration[5.2]
  def change
    create_table :packs do |t|
      t.string :name
      t.string :things

      t.timestamps
    end
  end
end
