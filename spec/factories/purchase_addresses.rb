FactoryBot.define do
  factory :purchase_address do
    token { "tok_abcdefghijk00000000000000000" }
    post_code { '123-4567' }
    city_id { "3" }
    municipality { '横浜市緑区' }
    block { '青山1-1' }
    building { '東京ハイツ' }
    number { '09012345678' }
    user_id { "1" }
    item_id { "3" }
  end
end