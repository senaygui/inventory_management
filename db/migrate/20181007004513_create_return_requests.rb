class CreateReturnRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :return_requests do |t|
    	t.references :admin_user, index: true, foreign_key: true
      t.string :product_name, null: false, default: ""
      t.decimal :quantity, null: false
			t.text :product_description, null: false, default: ""
			t.string :reference, null: false, default: ""
			t.string :sm_confirmation
      t.timestamps
    end
  end
end
