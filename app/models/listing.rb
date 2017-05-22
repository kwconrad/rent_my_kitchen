class Listing < ApplicationRecord
  belongs_to :kitchen

  validates :kitchen_id, :start_time, :end_time, :price_per_hour, presence: true

  def owner
    kitchen.owner
  end
end
