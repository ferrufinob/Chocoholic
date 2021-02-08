class User < ApplicationRecord
  has_many :reviews #they created
  has_many :reviewed_chocolates, through: :reviews, source: :chocolate #chocolates they have reviewed
  has_many :chocolates #they created
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true

  has_secure_password

  def self.from_omniauth(auth)
    User.find_or_create_by(uid: auth[:iud], provider: auth["provider"]) do |u|
      u.name = auth[:info][:name]
      u.email = auth[:info][:email]
      u.password = SecureRandom.hex(12)
    end
  end
end
