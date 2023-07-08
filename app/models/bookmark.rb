class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6 }
  validates :movie, :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: "Already bookmarked in this list" } # found on internet

  belongs_to :movie
  belongs_to :list
end
