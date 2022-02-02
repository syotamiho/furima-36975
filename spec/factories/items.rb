FactoryBot.define do
  factory :item do
    title {"商品名"}
    explanation {"商品の説明"}
    category_id {"2"}
    situation_id {"3"}
    postage_id {"3"}
    city_id {"10"}
    shipping_date_id {"3"}
    price {"612"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
