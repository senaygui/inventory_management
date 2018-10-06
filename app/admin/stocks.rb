ActiveAdmin.register Stock do
permit_params :admin_user_id, :product_name, :quantity, :unit_price, :total_price ,:measurment ,:part_number ,:reference ,:product_description
	controller do
    before_action :show_page_title, only: [:show]
    
    private
      def show_page_title
        @page_title = "#{Stock.find(params[:id]).product_name}"
      end
  end

  index do
    selectable_column
    id_column
    column :product_name do |t|
    	truncate t.product_name
    end
    column :quantity
    number_column :unit_price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: "", precision: 2
    number_column :total_price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: "", precision: 2
    column :part_number
    column :created_at
    column :updated_at
    actions
  end


	scope :newest_first
	
  filter :product_name
  filter :unit_price, as: :numeric_range_filter
  filter :part_number
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
    	f.input :admin_user_id, as: :hidden, :input_html => { :value => current_admin_user.id }
      f.input :product_name
      f.input :quantity
      f.input :unit_price
      f.input :total_price
      f.input :measurment
      f.input :part_number
      f.input :reference
      f.input :product_description
    end
    f.actions
  end

  show do
    panel "Stock" do
    	attributes_table_for stock do
	    
	     	row :product_name
	     	row :quantity
	     	number_row :unit_price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: "", precision: 2
				number_row :total_price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: "", precision: 2
				row :measurment
	     	row :part_number
	     	row :reference
      	row :product_description
	     	
     	end	
    end
  end
end
