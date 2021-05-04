class PurchaseManagement < ApplicationRecord
  has_one :purchase
  belongs_to :user
  belongs_to :item
end
