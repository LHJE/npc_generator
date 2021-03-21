class NpcModelPack < ApplicationRecord
  validates :npc_model_id,
            :pack_id, presence: true

  belongs_to :npc_model
  belongs_to :pack
end
