class User < ApplicationRecord
  has_secure_password

  has_many :images, dependent: :destroy

  validates :name, presence: true

  validates :email, uniqueness: true, presence: true
  validates :password, presence: { require: true }
  validates :password_confirmation, presence: { require: true }
end
