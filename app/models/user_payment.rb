class UserPayment
  include ActiveModel::Model
    attr_accessor :user_id, :item_id, :postal_code, :state_id, :city, :address, :building, :phone, :record_id

    validates :user_id, :item_id, :postal_code, :state_id, :city, :address, :building, :phone, :record_id, presence: true
    validates :postal_code format: {with: (/\A\d{3}[-]\d{4}\z/)}
    validates :phone       format: {with: (/\A\d{10,11}\z/)}
    def save
      Recrd.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, state_id: state_id, city: city, address: address, building: building, phone: phone, record_id: record_id)
    end
  end