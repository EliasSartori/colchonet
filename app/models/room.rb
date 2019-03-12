class Room < ApplicationRecord
  extend FriendlyId
  has_many :reviews, dependent: :destroy
  has_many :reviewed_rooms, through: :reviews, source: :room
  belongs_to :user

  scope :most_recent, -> { order('created_at DESC') }

  validates :title, presence: true
  validates :slug, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 30 }, allow_blank: false

  mount_uploader :picture, PictureUploader
  friendly_id :title, use: [:slugged, :history]

  def complete_name
    "#{title}, #{location}"
  end

  def self.search(query)
    if query.present?
        where(['location ILIKE :query OR
                        title ILIKE :query OR
                        description ILIKE :query', query: "%#{query}%"])
    else
      Room.all
    end
  end
end