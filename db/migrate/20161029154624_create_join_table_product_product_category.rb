class CreateJoinTableProductProductCategory < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :product_categories do |t|
      t.index [:product_id, :product_category_id], name: 'index_product_categories_products'
    end
  end
end
