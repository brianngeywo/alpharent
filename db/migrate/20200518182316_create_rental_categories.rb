class CreateRentalCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :rental_categories do |t|
      t.integer :rental_id
      t.integer :category_id
    end
  end
end
