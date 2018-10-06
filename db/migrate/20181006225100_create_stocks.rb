class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
    	t.references :admin_user, index: true, foreign_key: true
      t.string :product_name, null: false, default: ""
      t.integer :quantity, null: false
      t.decimal :unit_price, null: false
      t.decimal :total_price,null: false
      t.string :measurment, null: false, default: ""
      t.decimal :part_number, null: false
      t.string :reference, null: false, default: ""
      t.text :product_description, null: false, default: ""
      t.timestamps
    end
  end
end
