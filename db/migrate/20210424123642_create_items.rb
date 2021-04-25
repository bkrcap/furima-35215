class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,            null:false
      t.text :description_item,       null:false
      t.integer :category_id,         null:false
      t.integer :item_status_id,      null:false
      t.integer :shipping_charge_id,  null:false
      t.integer :shipping_area_id,    null:false
      t.integer :shipping_days_id,    null:false
      t.integer :selling_price,       null:false
      t.integer :user_id,             null:false, foreign_key: true

      t.timestamps
    end
  end
end
