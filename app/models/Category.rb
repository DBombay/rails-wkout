class Category < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :subCategories, dependent: :destroy
  has_many :products, through: :subCategories
end