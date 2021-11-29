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
  validates :category_id, :status_id, :delivery_period_id, :delivery_fee_id, :shipment_source_id, numericality: {other_than: 1, message: "は--以外から選択してください"}
  validates :item_price, numericality: {with: (/\A[0-9]+\z/), message: "は半角数字で入力してください"}
  validates_inclusion_of :item_price, in:300..9999999, message: "は300円~9,999,999円の間で設定して下さい"

end
