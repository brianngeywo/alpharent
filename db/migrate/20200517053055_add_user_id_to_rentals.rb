class AddUserIdToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :user_id, :integer
  end
end
