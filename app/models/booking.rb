class Booking < ApplicationRecord
  belongs_to :kitchen
  belongs_to :booker, foreign_key: :booker_id, class_name: "User"

  validates :kitchen_id, :booker_id, :guests_count, :start_time, :end_time, presence: true

  def owner
    kitchen.owner
  end
end
