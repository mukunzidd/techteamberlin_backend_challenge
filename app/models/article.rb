class Article < ApplicationRecord
  belongs_to :author

  # Validations
  validates :title, presence: { message: "article must have a title" }
  validates :title, uniqueness: true
end
