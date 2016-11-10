class ProductCategory < ApplicationRecord
  has_many :product_categories_products
  has_many :products, through: :product_categories_products

  validates :name, presence: true, length: { minimum: 3, maximum: 200 }

  before_destroy { |category| category.products.clear}
end
