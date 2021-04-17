class User < ApplicationRecord
  validates :name, presence: true

  validates :email, uniqueness: true, presence: true
  validates :google_token, presence: true, uniqueness: true

  def self.from_omniauth(access_token)
    user = find_by(uid: access_token.uid)
    return user unless user.nil?

    User.create(email: access_token.info.email,
                username: access_token.info.email,
                uid: access_token.uid)
  end
end
