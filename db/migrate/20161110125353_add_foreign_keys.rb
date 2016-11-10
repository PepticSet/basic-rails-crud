class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :product_categories_products, :products
    add_foreign_key :product_categories_products, :product_categories
  end
end
