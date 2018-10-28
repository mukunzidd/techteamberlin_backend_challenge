FactoryBot.define do
  factory :item do
    name { Faker::Name.name_with_middle }
  end
end