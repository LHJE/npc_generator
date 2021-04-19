class User < ApplicationRecord
  validates :name,
            :role, presence: true

  validates :email, uniqueness: true, presence: true
  validates :google_token, uniqueness: true, presence: true

  enum role: { 'default' => 0, 'admin' => 1 }

  def self.from_omniauth(access_token)
    user = find_by(uid: access_token.uid)
    return user unless user.nil?

    User.create(email: access_token.info.email,
                username: access_token.info.email,
                uid: access_token.uid)
  end
end
