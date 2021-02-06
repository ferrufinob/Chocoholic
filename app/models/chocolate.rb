class Chocolate < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :category
  belongs_to :user #that they created
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews #recieved
  validates :brand, presence: true
  validates :flavor, presence: true
  validates :flavor, uniqueness: { scope: :brand, message: " already exists for this brand" }
  scope :highest_rating, -> { left_outer_joins(:reviews).group("chocolates.id").order("avg(reviews.rating) DESC") }

  def category_attributes=(attribute)
    if !attribute[:name].blank?
      self.category = Category.find_or_create_by(attribute)
    end
  end

  def average_rating
    if self.reviews.size > 0
      self.reviews.average(:rating).to_i
    else
      "undefined"
    end
  end

  def dairy_free_yn
    dairy_free ? "Yes" : "No"
  end

  def nut_free_yn
    nut_free ? "Yes" : "No"
  end
end
