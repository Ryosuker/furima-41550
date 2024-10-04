FactoryBot.define do
  factory :item do
    item_name             { Faker::Commerce.product_name }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 1, to: 10) }
    condition_id          { Faker::Number.between(from: 1, to: 6) }
    shipping_fee_payer_id { Faker::Number.between(from: 1, to: 2) }
    shipping_area_id      { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id       { Faker::Number.between(from: 1, to: 3) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
