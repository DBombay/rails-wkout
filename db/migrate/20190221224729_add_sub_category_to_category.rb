class AddSubCategoryToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_categories, :sub_category_id, :integer
  end
end
