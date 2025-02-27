class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :role, inclusion: { in: %w[renter owner] }
end

