class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings, foreign_key: :booker_id, dependent: :destroy
  has_many :kitchens, dependent: :destroy
  has_one :user_account, dependent: :destroy
end
