class Product < ApplicationRecord
  has_many :product_categories_products
  has_many :product_categories, through: :product_categories_products

  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: true
  validates :description, length: { minimum: 4, maximum: 500 }

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  before_destroy { |product| product.product_categories.clear}
end
