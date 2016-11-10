class AddIdToProductCategoriesProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :product_categories_products, :id, :primary_key
  end
end
