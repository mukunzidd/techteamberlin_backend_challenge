class Article < ApplicationRecord
  belongs_to :author

  # Validations
  validates :title, presence: true
  validates :published_at, presence: true
  validates :title, uniqueness: true
end
