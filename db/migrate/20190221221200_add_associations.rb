class AddAssociations < ActiveRecord::Migration[5.2]
  def change
    change_table :sub_categories do |t|
      t.belongs_to :category, index: true
    end

    change_table :products do |t|
      t.belongs_to :category, index: true
      t.belongs_to :sub_category, index: true
    end
  end
end
