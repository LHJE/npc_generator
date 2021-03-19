class Weapon < ApplicationRecord
  validates :classification,
            :name,
            :cost,
            :damage,
            :weight,
            :properties, presence: true
end
