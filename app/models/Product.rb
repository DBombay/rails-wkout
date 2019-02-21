class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence:true
  validates :price, presence: true, default: 0
  validates :sale_price
  validates :active, default: true
  validates :on_sale, default: false
  validates :product_image, presence: true

  belongs_to :subCategory
end