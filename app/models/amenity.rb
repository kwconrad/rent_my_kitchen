class Amenity < ApplicationRecord
  has_many :kitchen_amenities, dependent: :destroy
  has_many :kitchens, through: :kitchen_amenities

  validates :name, :category, presence: true
end
