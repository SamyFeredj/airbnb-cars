class Review < ApplicationRecord
  belongs_to :reservation

  AUTHORIZED_RATINGS = (1..5)

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: AUTHORIZED_RATINGS }
end
