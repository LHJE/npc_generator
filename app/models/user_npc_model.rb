class UserNpcModel < ApplicationRecord
  validates :npc_model_id,
            :user_id, presence: true

  belongs_to :npc_model
  belongs_to :user
end
