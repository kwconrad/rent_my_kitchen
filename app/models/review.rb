class Review < ApplicationRecord
  belongs_to :kitchen
  belongs_to :user

  validates :rating, :comments, :user_id, :kitchen_id, presence: true
end
