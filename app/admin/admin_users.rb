ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role, :first_name ,:last_name ,:middle_name ,:department ,:job_role
  controller do
    before_action :new_page_title, only: [:new]
    before_action :index_page_title, only: [:index]
    private
      def new_page_title
        
        @page_title = "Create New User"
      end
      def index_page_title
        
        @page_title = "Users"
      end
  end
  index do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role,  :as => :select, :collection => ["RootAdmin", "GeneralManager", "StoreManager", "Purchaser", "Employee"], label: "Account Role"
      f.input :first_name
      f.input :last_name
      f.input :middle_name
      f.input :department
      f.input :job_role
    end
    f.actions
  end


end
