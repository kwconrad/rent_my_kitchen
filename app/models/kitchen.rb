class Kitchen < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  alias_attribute :owner, :user

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :description, :street_address, :city, :postal_code, :country, :capacity, presence: true
end
