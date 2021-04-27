class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_management
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_days

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description_item
    validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9999999 }
    #, message: には半角数字のみで入力して下さい

    with_options numericality: { other_than: 1 }do
      validates :category_id
      validates :item_status_id
      validates :shipping_charge_id
      validates :shipping_area_id
      validates :shipping_days_id
    end
  end
end