class Spell < ApplicationRecord
  validates :name,
            :description,
            :range,
            :components,
            :duration,
            :casting_time,
            :level,
            :school,
            :classes, presence: true
  validates :attack_type,
            :concentration,
            :damage,
            :higher_level,
            :material,
            :ritual, presence: false
end
