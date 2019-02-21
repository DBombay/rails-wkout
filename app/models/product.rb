class Product < ApplicationRecord
  validates :name, :description, :price, :product_image, presence: true

  belongs_to :category
  belongs_to :sub_category
end
