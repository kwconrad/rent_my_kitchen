class AddKitchenToReview < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :kitchen, foreign_key: true
  end
end
