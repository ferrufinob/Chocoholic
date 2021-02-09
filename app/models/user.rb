class User < ApplicationRecord
  has_many :reviews #they created
  has_many :reviewed_chocolates, through: :reviews, source: :chocolate #chocolates they have reviewed
  has_many :chocolates #they created
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :password, length: { minimum: 6 }

  has_secure_password

  def self.from_omniauth(auth)
    self.find_or_create_by(uid: auth[:uid], provider: auth["provider"]) do |u|
      u.name = auth[:info][:name]
      u.email = auth[:info][:email]
      u.password = SecureRandom.hex(12)
    end
  end
end
