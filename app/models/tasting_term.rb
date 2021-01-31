class TastingTerm < ApplicationRecord
  has_many :chocolate_tasting_terms
  has_many :chocolates, through: :chocolate_tasting_terms
end
