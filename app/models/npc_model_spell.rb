class NpcModelSpell < ApplicationRecord
  validates :npc_model_id,
            :spell_id, presence: true

  belongs_to :npc_model
  belongs_to :spell
end
