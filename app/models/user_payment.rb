class UserPayment
  include ActiveModel::Model
    attr_accessor :user_id, :item_id, :postal_code, :shipment_source_id, :city, :address, :building, :phone, :record_id, :token

    validates :user_id, :item_id, :postal_code, :shipment_source_id, :city, :address, :phone, :token, presence: true
    validates :postal_code, format: { with: (/\A[0-9]{3}-[0-9]{4}\z/), message: "は「3桁ハイフン4桁」の半角文字列のみで入力してください"}
    validates :phone,       format: { with: (/\A[0-9]{10,11}\z/), message: "は10桁以上11桁以内の半角数値のみ入力してください"}
    def save
      record = Record.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, address: address, building: building, phone: phone, record_id: record.id)
    end
  end