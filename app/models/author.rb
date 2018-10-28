class Author < ApplicationRecord
  has_many :articles, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
end
