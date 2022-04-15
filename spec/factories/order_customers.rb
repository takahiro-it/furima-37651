FactoryBot.define do
  factory :order_customer do

    token {"tok_abcdefghijk00000000000000000"}
    
    
    post_code           { "123-4567" }
    prefecture_id       { 13 }
    city                { "渋谷区" }
    address             { "テスト坂1-1" }
    building_name       { "テストビル101" }
    phone_number        { "09012345678" }
    

  end
end
