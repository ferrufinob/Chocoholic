class Chocolate < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :category
  belongs_to :user #creator
  has_many :reviews #recieved
  has_many :reviewers, through: :reviews, source: :user
  has_many :chocolate_tasting_notes
  has_many :tasting_notes, through: :chocolate_tasting_notes
end
