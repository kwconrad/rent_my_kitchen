class Kitchen < ApplicationRecord
  belongs_to :user
  has_many: :bookings
  has_many: :listings
end
