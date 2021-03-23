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
            :damage_type,
            :damage_at_character_level,
            :damage_at_slot_level,
            :higher_level,
            :material,
            :ritual,
            :subclasses, presence: false
end
