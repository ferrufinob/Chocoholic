class Chocolate < ApplicationRecord
  belongs_to :category
  belongs_to :user #that they created
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user #recieved

  # ! leave this last, deal with after I meet all requirements
  # has_many :chocolate_tasting_terms
  # has_many :tasting_terms, through: :chocolate_tasting_terms
end