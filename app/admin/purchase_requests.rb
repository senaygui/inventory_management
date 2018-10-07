ActiveAdmin.register PurchaseRequest do
permit_params :admin_user_id,:product_name,:quantity,:measurment,:product_description,:purchaser_approval,:denied_description

	controller do
    before_action :show_page_title, only: [:show]
    
    private
      def show_page_title
        @page_title = "Purchase Request"
      end
  end

  index do
    selectable_column
    if current_admin_user.role == "Purchaser"
	    column "Rquester" do |r|
	      user = AdminUser.find(r.admin_user_id)
	      word_wrap("#{user.first_name} #{user.last_name }", :line_width => 7)
	    end
  	end
    column :product_name do |t|
    	truncate t.product_name
    end
    number_column :quantity
    column("Purchaser Approval",:purchaser_approval) {|estimate| status_tag(estimate.purchaser_approval,:warn)}
    column :measurment
    column :created_at
    actions
  end

  filter :product_name
  filter :created_at
  filter :purchaser_approval

   
	scope :pending
	scope :newest_first
	scope :denied
	scope :accepted
  scope :completed

	form do |f|
  	f.semantic_errors *f.object.errors.keys 
    f.inputs do
    	
    	if current_admin_user.role == "StoreManager"
	    	f.input :admin_user_id, as: :hidden, :input_html => { :value => current_admin_user.id }
	      f.input :product_name
	      f.input :quantity
	      f.input :measurment
      end
      if current_admin_user.role == "Purchaser"
	      f.input :purchaser_approval,  :as => :select, :collection => ["Pending","Accepted", "Denied", "Completed"], label: "Purchaser Approval Status"
	      f.input :denied_description, label: "Purchaser Denied Reason"
    	end    	
    end
    f.actions
  end

  show do
    panel "Purchase Request" do
    	attributes_table_for purchase_request do
	      row "Rquester" do |r|
		      user = AdminUser.find(r.admin_user_id)
		      word_wrap("#{user.first_name} #{user.last_name }", :line_width => 7)
		    end
	     	row :product_name
        row :quantity
	     	row :measurment
	     	row :purchaser_approval
	     	row :denied_description 
        row :created_at
        row :updated_at	
     	end	
    end
  end
end
