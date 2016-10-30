class Product < ApplicationRecord
  has_and_belongs_to_many :product_categories
  before_destroy { |product| product.product_categories.clear}
end
