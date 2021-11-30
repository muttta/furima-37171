FactoryBot.define do
  factory :user_payment do
    postal_code {'123-4567'}
    shipment_source_id {2}
    city {'名古屋市'}
    address {'1-1'}
    building {'東京ハイツ'}
    phone {'00011112222'}
  end
end
