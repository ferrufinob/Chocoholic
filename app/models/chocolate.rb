class Chocolate < ApplicationRecord
  has_one_attached :avatar
  belongs_to :category
  belongs_to :user #that they created
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews #recieved
  validates :flavor, uniqueness: { scope: :brand, message: " already exists for this brand" }
  scope :most_popular, -> { where("rating >= 4 ") }
  # ! leave this last, deal with after I meet all requirements
  has_many :chocolate_tasting_terms, dependent: :destroy
  has_many :tasting_terms, through: :chocolate_tasting_terms

  #scopes => darkest chocolates(order them from darkest to least dark)
  #make a search bar

  def category_attributes=(attribute)
    if !attribute[:name].blank?
      self.category = Category.find_or_create_by(attribute)
    end
  end

  def tasting_terms_attributes=(term_attributes)
    term_attributes.values.each do |t|
      term = TastingTerm.find_or_create_by(term: term_attributes[:term])
      self.tasting_terms << term
    end
  end
end
