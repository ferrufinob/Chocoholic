class TastingTerm < ApplicationRecord
  has_many :chocolate_tasting_terms #my look up table
  has_many :chocolates, through: :chocolate_tasting_terms #
end
