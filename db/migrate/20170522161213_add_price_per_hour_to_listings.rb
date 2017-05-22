class AddPricePerHourToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :price_per_hour, :integer
  end
end
