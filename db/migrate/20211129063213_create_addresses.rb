class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.string :city,        null: false
      t.string :address,     null: false
      t.string :building
      t.string :phone,       null: false
      t.integer :shipment_source_id,   null: false
      t.references :record,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
