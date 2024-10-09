FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-9827' }
    shipping_area_id { Faker::Number.between(from: 1, to: 47) }
    city { '東京都' }
    street_line { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09098762342' }
  end
end
