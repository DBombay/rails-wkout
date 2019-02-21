class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.float :sale_price
      t.boolean :active
      t.boolean :on_sale
      t.string :product_image

      t.timestamps
    end
  end
end
