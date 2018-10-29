require 'rails_helper'

# Test SUITE for the Author model
RSpec.describe Author, type: :model do
  # Association test
  it {should have_many(:articles).dependent(:destroy)}

  # Validation tests
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
end