FactoryBot.define do
  factory :item do
    
    after(:build) do |item|
    @item.image = fixture_file_upload('public/images/test_image.png')

    name { Faker::Commerce.product_name }
    description { Faker::Lorem.characters(16) }
    category_id { Faker::Number.within(range: 1..10) }
    shopping_cost_id { Faker::Number.within(range: 1..2) }
    status_id { Faker::Number.within(range: 1..6) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    shopping_day_id { Faker::Number.within(range: 1..3) }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
end