FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    published_at { Faker::Lorem.word }
  end
end