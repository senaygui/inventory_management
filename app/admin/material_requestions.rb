ActiveAdmin.register MaterialRequestion do

  permit_params :admin_user_id,:product_name,:quantity,:reason_of_request,:general_manager_approval_status,:store_manager_request_status,:gm_acceptance_condition,:sm_denied_reason,:gm_denied_reason
  controller do
    before_action :show_page_title, only: [:show]
    
    private
      def show_page_title
        @page_title = "Material Requestion"
      end
  end
  index do
    selectable_column
    if current_admin_user.role == "GeneralManager" || current_admin_user.role == "StoreManager"
	    column "Rquester" do |r|
	      user = AdminUser.find(r.admin_user_id)
	      word_wrap("#{user.first_name} #{user.last_name }", :line_width => 7)
	    end
  	end
    column :product_name do |t|
    	truncate t.product_name
    end
    number_column :quantity
    column("GM Approval Status",:general_manager_approval_status) {|estimate| status_tag(estimate.general_manager_approval_status,:warn)}
    column("SM Approval Status",:store_manager_request_status) {|estimate| status_tag(estimate.store_manager_request_status,:warn ) }
    column :created_at
    actions
  end

  filter :product_name
  filter :created_at
  filter :general_manager_approval_status
  filter :store_manager_request_status

   
	scope "Unapproved",:pending
	scope :newest_first
	scope :denied
	scope :accepted
 	scope :completed

  form do |f|
  	f.semantic_errors *f.object.errors.keys 
    f.inputs do
    	
    	if current_admin_user.role == "Employee"
	    	f.input :admin_user_id, as: :hidden, :input_html => { :value => current_admin_user.id }
	      f.input :product_name
	      f.input :quantity
	      f.input :reason_of_request
      end
      if current_admin_user.role == "GeneralManager"
	      f.input :general_manager_approval_status,  :as => :select, :collection => ["Pending","Accepted", "Denied"], label: "General Manager Approval Status"
	      
	      f.input :gm_acceptance_condition,  :as => :select, :collection => ["If the product is in store", "both"], label: "General Manager Acceptance Condition"
	      
	      f.input :gm_denied_reason, label: "General Manager Denied Reason"
    	end
    	if current_admin_user.role == "StoreManager"
	      f.input :store_manager_request_status,  :as => :select, :collection => ["Pending","Accepted", "Denied", "Completed"], label: "Store Manager Approval Status"
	      f.input :sm_denied_reason, label: "Store Denied Reason"
    	end
      
    end
    f.actions
  end
  
  show do
    panel "Material Requestion" do
    	attributes_table_for material_requestion do
	      row "Rquester" do |r|
		      user = AdminUser.find(r.admin_user_id)
		      word_wrap("#{user.first_name} #{user.last_name }", :line_width => 7)
		    end
	     	row :product_name
        row :quantity
	     	row :reason_of_request
	     	row :general_manager_approval_status
	     	row :gm_acceptance_condition
				row :gm_denied_reason
				row :store_manager_request_status
	     	row :sm_denied_reason
	     	row :created_at
        row :updated_at
     	end	
    end
  end




end
