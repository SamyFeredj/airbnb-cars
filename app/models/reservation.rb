class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user
  # has_many :reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :total_price, presence: true, numericality: true
  validates :status, presence: true, inclusion: { in: ["Pending", "Accepted", "Rejected"], allow_nil: false }
end
