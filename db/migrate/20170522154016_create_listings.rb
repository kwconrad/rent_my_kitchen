class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :kitchen, foreign_key: true
      t.integer :price
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
