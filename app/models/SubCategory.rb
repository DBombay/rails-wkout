class SubCategory < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :category
  has_many :products
end