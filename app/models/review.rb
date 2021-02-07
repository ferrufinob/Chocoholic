class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chocolate
  validates :rating, presence: true
  validates :comment, presence: true
  validates :chocolate, uniqueness: { scope: :user, message: "you have already commented on this chocolate" }
  scope :by_created_at, -> { order("created_at DESC") }
end
