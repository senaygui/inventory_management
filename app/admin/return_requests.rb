ActiveAdmin.register ReturnRequest do
	permit_params :admin_user_id,:product_name,:quantity,:product_description,:reference,:sm_confirmation

	controller do
    before_action :show_page_title, only: [:show]
    
    private
      def show_page_title
        @page_title = "Purchase Request"
      end
  end

  index do
    selectable_column
    if current_admin_user.role == "StoreManager"
	    column "Rquester" do |r|
	      user = AdminUser.find(r.admin_user_id)
	      word_wrap("#{user.first_name} #{user.last_name }", :line_width => 7)
	    end
  	end
    column :product_name do |t|
    	truncate t.product_name
    end
    number_column :quantity
    column("StoreManager Approval",:sm_confirmation) {|estimate| status_tag(estimate.sm_confirmation,:warn)}
    column :reference
    column :product_description
    column :created_at
    actions
  end

  scope :pending
	scope :newest_first
	scope :denied
	scope :accepted
	scope :completed

  filter :product_name
  filter :created_at
  filter :sm_confirmation

  form do |f|
  	f.semantic_errors *f.object.errors.keys 
    f.inputs do
    	
    	if current_admin_user.role == "Employee"
	    	f.input :admin_user_id, as: :hidden, :input_html => { :value => current_admin_user.id }
	      f.input :product_name
	      f.input :quantity
	      f.input :reference
	      f.input :product_description
      end
      if current_admin_user.role == "StoreManager"
	      f.input :sm_confirmation,  :as => :select, :collection => ["Pending","Accepted", "Denied", "Completed"], label: "StoreManager Approval Status"
    	end    	
    end
    f.actions
  end

  show do
    panel "Return Request" do
    	attributes_table_for return_request do
	      row "Rquester" do |r|
		      user = AdminUser.find(r.admin_user_id)
		      word_wrap("#{user.first_name} #{user.last_name }", :line_width => 7)
		    end
	     	row :product_name
        row :quantity
	     	row :reference
	     	row :product_description
	     	row :sm_confirmation 	
	     	row :created_at
	     	row :updated_at
     	end	
    end
  end
end
