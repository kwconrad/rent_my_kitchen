class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :kitchen, foreign_key: true
      t.integer :booker_id
      t.integer :guests_count
      t.string :status
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
    add_index :bookings, :booker_id
  end
end
