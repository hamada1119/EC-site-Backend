class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :cart_items, dependent: :destroy

  validates :product_name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true
  validates :available_qty, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  scope :by_category, ->(category_name) { joins(:category).where(categories: { name: category_name }) if category_name.present? }
  scope :sort_by_price, ->(direction) { order(price: direction) if direction.in?(%w[asc desc]) }

  def is_new?
    release_date.present? && release_date > 30.days.ago
  end

  def image_url
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      nil
    end
  end
end
