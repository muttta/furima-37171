FactoryBot.define do
  factory :item do
    item_name    { "test" }
    item_price   { 1000 }
    description  { "test" } 
    category_id        { 2 }
    status_id          { 2 }
    delivery_fee_id    { 2 }
    delivery_period_id { 2 }
    shipment_source_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end