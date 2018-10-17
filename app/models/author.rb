class Author < ApplicationRecord
  has_many :articles

  # Validations
  validates :name, presence: { message: "author must have a name" }
  validates :name, uniqueness: true
end
