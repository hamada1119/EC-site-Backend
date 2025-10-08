class CartItem < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :session_id, presence: true
  validates :product_id, uniqueness: { scope: :session_id }
end
