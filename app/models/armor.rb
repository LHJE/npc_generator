class Armor < ApplicationRecord
  validates :classification,
            :name,
            :cost,
            :armor_class,
            :strength,
            :stealth,
            :weight, presence: true
end
