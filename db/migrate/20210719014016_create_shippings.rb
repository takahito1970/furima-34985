class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.references :order, null:false,foreign_key: true
      t.string :postar_code, null: false
      t.integer :shipping_form_id, null: false
      t.string :minicipality, null: false
      t.string :address, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end