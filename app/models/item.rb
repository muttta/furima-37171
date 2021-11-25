class Item < ApplicationRecord
  belongs_to :user
  has_one    :record

  validates :item_name            presence: true
  validates :item_price           presence: true
  validates :description          presence: true
  validates :category_id          presence: true
  validates :status_id            presence: true
  validates :delivery_period_id   presence: true
  validates :delivery_fee_id      presence: true
  validates :shipment_source_id   presence: true

end
