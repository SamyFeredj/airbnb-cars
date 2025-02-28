class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :brand, presence: true
  validates :car_model, presence: true
  validates :car_location, presence: true
  validates :rent_price, presence: true, numericality: true
  validates :kilometers, numericality: true, allow_nil: true
  validates :release_year, numericality: { only_integer: true }, allow_nil: true
  has_one_attached :photo
end
