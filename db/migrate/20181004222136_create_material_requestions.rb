class CreateMaterialRequestions < ActiveRecord::Migration[5.2]
  def change
    create_table :material_requestions do |t|
	  	t.references :admin_user, index: true, foreign_key: true
      t.string :product_name, null: false, default: ""
      t.integer :quantity, null: false, default: ""
      t.string :reason_of_request, null: false, default: ""
      t.string :general_manager_approval_status, default: "Pending"
      t.string :store_manager_request_status
      t.string :gm_acceptance_condition
      t.string :sm_denied_reason
      t.string :gm_denied_reason
      t.timestamps
    end
  end
end
