ActiveAdmin.register ReturnRequest do
	permit_params :admin_user_id,:product_name,:quantity,:product_description,:reference

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
end
