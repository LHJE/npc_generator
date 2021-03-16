class Pack < ApplicationRecord
  validates :name,
            :things, presence: true
end
