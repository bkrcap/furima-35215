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
end
