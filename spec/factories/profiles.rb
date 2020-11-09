FactoryBot.define do
  factory :profile do
    introduction { Faker::Lorem.sentences }
    category_id { Faker::Number.between(from: 2, to: 4) }
    genre_id { Faker::Number.between(from: 2, to: 11) }
  end
end
