FactoryBot.define do
  factory :item do
    item_name          {'商品名'}
    description_item   {'商品説明'}
    category_id        {2}
    item_status_id     {2}
    shipping_charge_id {2}
    shipping_area_id   {2}
    shipping_days_id   {2}
    selling_price      {5000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end