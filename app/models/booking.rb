class Booking < ApplicationRecord
  belongs_to :kitchen
  belongs_to :booker, foreign_key: :booker_id, class_name: "User"
end
