class AddPhotoToKitchen < ActiveRecord::Migration[5.0]
  def change
    add_column :kitchens, :photo, :string
  end
end
