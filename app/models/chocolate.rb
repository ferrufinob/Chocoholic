class Chocolate < ApplicationRecord
  has_one_attached :avatar
  belongs_to :category
  belongs_to :user #that they created
  has_many :reviews
  has_many :users, through: :reviews #recieved
  validates :flavor, uniqueness: { scope: :brand, message: " already exists for this brand" }

  # ! leave this last, deal with after I meet all requirements
  # has_many :chocolate_tasting_terms
  # has_many :tasting_terms, through: :chocolate_tasting_terms

  #scopes => darkest chocolates(order them from darkest to least dark)

  def category_attributes=(attribute)
    if !attribute[:name].blank?
      self.category = Category.find_or_create_by(attribute)
    end
  end
end
