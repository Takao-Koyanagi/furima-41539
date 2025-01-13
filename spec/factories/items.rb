FactoryBot.define do
  factory :item do
    name             {'test'}
    price            {1000}
    description      {"test"}
    category_id      {2}
    condition_id     {2}
    shipping_cost_id {2}
    prefecture_id    {2}
    shipping_day_id  {2}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
