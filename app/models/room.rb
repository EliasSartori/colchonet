class Room < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :reviewed_rooms, through: :reviews, source: :room
  belongs_to :user

  scope :most_recent, -> { order('created_at DESC') }

  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 30 }, allow_blank: false

  def complete_name
    "#{title}, #{location}"
  end
end