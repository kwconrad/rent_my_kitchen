class CreateKitchenAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchen_amenities do |t|
      t.references :kitchen, foreign_key: true
      t.references :amenity, foreign_key: true

      t.timestamps
    end
  end
end
