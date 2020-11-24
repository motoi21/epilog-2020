FactoryBot.define do
  factory :offer do
    order_name { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentences }
    deadline { Faker::Date.between(from: '2020-01-01', to: '2025-12-31') }
    category_id { Faker::Number.between(from: 2, to: 4) }
    genre_id { Faker::Number.between(from: 2, to: 11) }
    budget { Faker::Number.between(from: 100, to: 9_999_999) }
  end
end
