class ProductCategory < ApplicationRecord
  has_and_belongs_to_many :products
  before_destroy { |category| category.products.clear}
end
