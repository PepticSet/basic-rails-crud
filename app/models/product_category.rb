class ProductCategory < ApplicationRecord
  has_and_belongs_to_many :products

  validates :name, presence: true, length: { minimum: 3, maximum: 200 }

  before_destroy { |category| category.products.clear}
end
