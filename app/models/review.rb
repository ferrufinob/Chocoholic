class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chocolate
  validates :rating, presence: true
  validates :comment, length: { minimum: 4 }
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than: 0 }
  scope :by_created_at, -> { order("created_at DESC") }
end
