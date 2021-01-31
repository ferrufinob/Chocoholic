class User < ApplicationRecord
  has_many :reviews #they create
  has_many :reviewed_chocolates, through: :reviews, source: :chocolate #chocolates they have reviewed
  #SELECT "chocolates".* FROM "chocolates" INNER JOIN "reviews" ON "chocolates"."id" = "reviews"."chocolate_id" WHERE "reviews"."user_id" = ? LIMIT ?

  has_many :chocolates #they created
  #SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?
  #SELECT "chocolates".* FROM "chocolates" WHERE "chocolates"."user_id" = ? LIMIT ?
  has_secure_password
end
