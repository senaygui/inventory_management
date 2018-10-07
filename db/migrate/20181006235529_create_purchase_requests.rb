class CreatePurchaseRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_requests do |t|
    	t.references :admin_user, index: true, foreign_key: true
      t.string :product_name, null: false, default: ""
      t.decimal :quantity, null: false
      t.string :measurment, null: false, default: ""
      t.text :product_description, null: false, default: ""
      t.string :purchaser_approval
      t.text :denied_description
      t.timestamps
    end
  end
end
