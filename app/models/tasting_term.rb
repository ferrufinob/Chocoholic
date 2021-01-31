class TastingTerm < ApplicationRecord
  has_many :chocolate_tasting_terms #terms
  has_many :chocolates, through: :chocolate_tasting_terms #the chocolates with those terms
end
