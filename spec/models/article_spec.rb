require 'rails_helper'

# Test SUITE for Article Model 
RSpec.describe Article, type: :model do
  # Association Test
  it {should belong_to(:author)}

  # Validation Test
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:published_at)}
  it {should validate_uniqueness_of(:title)}
end

