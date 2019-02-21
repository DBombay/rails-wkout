class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.float :sale_price, default: 1.00
      t.boolean :active, default: true
      t.boolean :on_sale, default: false
      t.string :product_image

      t.timestamps
    end
  end
end
