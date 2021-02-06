class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chocolate
  validates :rating, presence: true
  validates :comment, presence: true
  #dont allow user to review chocolate more than once
  # scope :by_created_at, -> { order("created_at DESC") }
end
