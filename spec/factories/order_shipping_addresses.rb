FactoryBot.define do
  factory :order_shipping_address do
    postal_code    { '123-4567' }
    prefecture_id  { rand(1..47) }
    city           { Faker::Lorem.word }
    address        { Faker::Lorem.word }
    building       { Faker::Lorem.word }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
