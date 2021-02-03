class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chocolate
  validates :rating, :comment, presence: true
  # scope :most_popular, -> { where("rating >= 4 ") }
  #most popular chocolates(most reviewed)
  scope :by_created_at, -> { order("created_at DESC") }
end
