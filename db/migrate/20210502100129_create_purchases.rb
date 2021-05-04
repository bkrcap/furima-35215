class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :postal_code,             null:false
      t.integer :shipping_area_id,       null:false
      t.string :municipality,            null:false
      t.string :addres,                  null:false
      t.string :building_name
      t.string :phone_number,            null:false
      t.integer :purchase_management_id, null:false ,foreign_key: true

      t.timestamps
    end
  end
end


