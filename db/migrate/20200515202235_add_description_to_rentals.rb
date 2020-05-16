class AddDescriptionToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :description, :text
    add_column :rentals, :created_at, :datetime
    add_column :rentals, :updated_at, :datetime
  end
end
