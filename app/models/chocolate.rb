class Chocolate < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :category
  belongs_to :user #that they created
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews #recieved
  validates :brand, presence: true
  validates :flavor, presence: true
  validates :flavor, uniqueness: { scope: :brand, message: " already exists for this brand" }
  # scope :most_popular, -> { where("rating >= 4 ") }

  def category_attributes=(attribute)
    if !attribute[:name].blank?
      self.category = Category.find_or_create_by(attribute)
    end
  end

  def dairy_free_yn
    dairy_free ? "Yes" : "No"
  end

  def nut_free_yn
    nut_free ? "Yes" : "No"
  end
end
