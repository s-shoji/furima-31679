FactoryBot.define do
  factory :user_purchase do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    building_name { '東京ハイツ' }
    address { '青山1-1-1' }
    phone { '09012345678' }
    purchase_id { 12 }
    item_id { 5 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
