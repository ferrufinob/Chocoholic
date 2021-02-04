class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chocolate
  validates :rating, presence: true
  validates :comment, presence: true
  # scope :most_popular, -> { where("rating >= 4 ") }
  #most popular chocolates(most reviewed)
  #dont allow user to review chocolate more than once
  # scope :by_created_at, -> { order("created_at DESC") }
end
