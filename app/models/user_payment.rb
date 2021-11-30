class UserPayment
  include ActiveModel::Model
    attr_accessor :user_id, :item_id, :postal_code, :shipment_source_id, :city, :address, :building, :phone, :record_id

    validates :user_id, :item_id, :postal_code, :shipment_source_id, :city, :address, :phone, presence: true
    validates :postal_code, format: { with: (/\A[0-9]{3}-[0-9]{4}\z/)}
    validates :phone,       format: { with: (/\A[0-9]{10,11}\z/)}
    def save
      record = Record.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, address: address, building: building, phone: phone, record_id: record.id)
    end
  end