class Review < ApplicationRecord
  POINTS = (1..5).to_a

  belongs_to :user
  belongs_to :room

  validates :user_id, uniqueness: {scope: :room_id}
  validates :points, presence: true, inclusion: { in: POINTS}
end