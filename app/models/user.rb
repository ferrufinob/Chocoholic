class User < ApplicationRecord
  has_many :reviews #they created
  has_many :reviewed_chocolates, through: :reviews, source: :chocolate #they recieved
  has_many :chocolates #they created
  has_secure_password
end
