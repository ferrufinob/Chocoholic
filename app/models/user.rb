class User < ApplicationRecord
  has_many :reviews #they created
  has_many :reviewed_chocolates, through: :reviews, source: :chocolate #chocolates they have reviewed
  has_many :chocolates #they created
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true

  has_secure_password
end
