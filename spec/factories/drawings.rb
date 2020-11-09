FactoryBot.define do
  factory :drawing do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentences }
    production_date { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
    category_id { Faker::Number.between(from: 2, to: 4) }
    genre_id { Faker::Number.between(from: 2, to: 11) }
    price { Faker::Number.between(from: 100, to: 9_999_999) }
    shipping_method_id { Faker::Number.between(from: 2, to: 6) }
    width { Faker::Number.between(from: 1, to: 100) }
    height { Faker::Number.between(from: 1, to: 100) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
