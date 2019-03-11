class Room < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 30 }, allow_blank: false

  def complete_name
    "#{title}, #{location}"
  end
end