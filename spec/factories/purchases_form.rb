FactoryBot.define do
  factory :purchase_form do
    postal_code             {'222-2222'}
    shipping_area_id        {2}
    municipality            {'テスト市テスト区'}
    addres                  {'テスト1-1-1'}
    building_name           {"テストビル"}
    phone_number            {9012345678}
    token                   {"tok_abcdefghijk00000000000000000"}
    #purchase_management_id  {2}
  end
end
