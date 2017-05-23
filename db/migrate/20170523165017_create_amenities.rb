class CreateAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :amenities do |t|
      t.string :name
      t.string :category
      t.string :font_awesome_icon
      t.timestamps
    end
  end
end
