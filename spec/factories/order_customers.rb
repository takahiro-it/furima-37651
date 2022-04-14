FactoryBot.define do
  factory :order_customer do
    token { 'eovnieonvievsa' }
    postal_code { '777-7777' }
    prefecture_id { Faker::Number.within(range: 1..2) }
    municipality { Gimei.address.city.kanji }
    address { Gimei.address.town.kanji }
    phone_number { '00000000000' }
    association :product
    association :user
  end
end
