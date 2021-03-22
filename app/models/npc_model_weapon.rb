class NpcModelWeapon < ApplicationRecord
  validates :npc_model_id,
            :weapon_id, presence: true

  belongs_to :npc_model
  belongs_to :weapon
end
