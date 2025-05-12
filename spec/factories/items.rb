FactoryBot.define do
  factory :item do
    name { 'サンプル商品' }
    description { 'とても良い商品です' }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    item_price { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample.png'), filename: 'sample.png', content_type: 'image/png')
    end
  end
end
