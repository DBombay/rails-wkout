class SubCategory < ApplicationRecord
  validates :name, :description, presence: true

  belongs_to :category
  has_many :products
end
