FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {"1"}
    status_id {"1"}
    shipping_cost_id {"1"}
    prefecture_id {"1"}
    shipping_days_id {"1"}
    price {"100"}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
