class CreateKitchens < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchens do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :country
      t.integer :capacity
      t.integer :price_per_hour

      t.timestamps
    end
  end
end
