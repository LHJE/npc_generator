class NpcModelArmor < ApplicationRecord
  validates :npc_model_id,
            :armor_id, presence: true

  belongs_to :npc_model
  belongs_to :armor
end
