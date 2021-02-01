class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chocolate

  #most popular chocolates(most reviewed)
end
