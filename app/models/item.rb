class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :delivery_period
  belongs_to       :delivery_fee
  belongs_to       :status
  belongs_to       :shipment_source
  belongs_to       :user
  has_one          :record
  has_one_attached :image 

  validates :item_name, :item_price, :description, :category_id, :status_id, :delivery_period_id, :delivery_fee_id, :shipment_source_id, :image, presence: true
  validates :category_id, :status_id, :delivery_period_id, :delivery_fee_id, numericality: {other_than: 1, message: "can't be blank"}

  validates :item_price, numericality: {in: 300..999999999, message: "は300円~999,999,999円の間で設定して下さい"}

end
