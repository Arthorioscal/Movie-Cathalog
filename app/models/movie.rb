class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :genre

  enum status: { unreleased: 0, released: 1}
  has_one_attached :poster
end
