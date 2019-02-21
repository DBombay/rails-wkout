class Category < ApplicationRecord
  validates :name, :description, presence: true

  has_many :sub_categories, dependent: :destroy
  has_many :products, through: :sub_categories
end
