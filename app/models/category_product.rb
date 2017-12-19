class CategoryProduct < ApplicationRecord
  has_many :product
  has_many :category
end
