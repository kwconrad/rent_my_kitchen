class RemovePriceFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :price, :integer
  end
end
