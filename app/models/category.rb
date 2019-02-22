class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :sub_categories, dependent: :destroy
  has_many :products, through: :sub_categories
end
