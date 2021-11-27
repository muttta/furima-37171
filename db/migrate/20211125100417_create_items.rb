class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,           null: false
      t.integer :item_price,          null: false
      t.text    :description,         null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :delivery_period_id,  null: false
      t.integer :delivery_fee_id,     null: false 
      t.integer :shipment_source_id,  null: false
      t.references :user,             null: false,  foreign_key: true

      t.timestamps
    end
  end
end
