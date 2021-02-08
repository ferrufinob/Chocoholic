class Chocolate < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :category
  belongs_to :user #that they created
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews #recieved
  validates :brand, presence: true
  validates :flavor, presence: true
  validates :flavor, uniqueness: { scope: :brand, message: " already exists for this brand" }
  validate :acceptable_image
  validates :image, presence: true
  scope :by_created_at, -> { order("created_at DESC") }

  scope :highest_rating, -> { left_outer_joins(:reviews).group("chocolates.id").order("avg(reviews.rating) DESC") }

  def category_attributes=(attribute)
    if !attribute[:name].blank?
      self.category = Category.find_or_create_by(attribute)
    end
  end

  #calculate the rating average to display in show page
  def average_rating
    self.reviews.average(:rating).to_i
  end

  def dairy_free_yn
    dairy_free ? "Yes" : "No"
  end

  def nut_free_yn
    nut_free ? "Yes" : "No"
  end

  def self.search(search)
    if search
      self.where("flavor LIKE ? OR brand LIKE ?", "%#{search}%", "%#{search}%")
    end
  end

  #webp images keep breaking my app
  def acceptable_image
    return unless image.attached?
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG")
    end
  end
end
