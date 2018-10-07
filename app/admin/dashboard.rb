ActiveAdmin.register_page "Dashboard" do

menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }


  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do

      if current_admin_user.role == "RootAdmin"
        span class: "blank_slate", style: "margin:1.2em; width: 300px; height: 100px;" do
          h2 do
              link_to("#{admin_admin_users_path}", options: {method: :get} )  do
                  "Manage Adminstrators"
              end
          end
          small "Mange New Generation Employee's Accounts"
        end
      end
      if current_admin_user.role == "Employee" || current_admin_user.role == "GeneralManager" || current_admin_user.role == "StoreManager"
        span class: "blank_slate", style: "margin:1.2em; width: 300px; height: 100px;" do
          h2 do
              link_to("#{admin_material_requestions_path}", options: {method: :get})  do
                  "Material Requestions"
              end
          end
          small "Create Material Requestions"
        end
      end
      if current_admin_user.role == "StoreManager"
        span class: "blank_slate", style: "margin:1.2em; width: 300px; height: 100px;" do
          h2 do
              link_to("#{admin_stocks_path}", options: {method: :get})  do
                  "Manage Stocks"
              end
          end
          small "Stock Management"
        end
      end
      if current_admin_user.role == "StoreManager" || current_admin_user.role == "Employee"
        span class: "blank_slate", style: "margin:1.2em; width: 300px; height: 100px;" do
          h2 do
              link_to("#{admin_return_requests_path}", options: {method: :get})  do
                  "Return Request"
              end
          end
          small "Manage Return Request"
        end
      end
      if current_admin_user.role == "StoreManager" || current_admin_user.role == "Purchaser"
        span class: "blank_slate", style: "margin:1.2em; width: 300px; height: 100px;" do
          h2 do

              link_to("#{admin_purchase_requests_path}", options: {method: :get}, html_options:{class: "btn"} )  do
                  "Purchase Requests "
              end

          end
          small "manage new generation purchase requests"
        end
      end
    end
  end
  sidebar "User Information" do

      span  do
        # a href: "#{current_admin_user}" do
           h3 style: "margin-left: 20px; padding-bottom: 10px;" do 
            "#{current_admin_user.first_name}"
           end
      end
      ul style: "list-style:none;" do
        li "#{current_admin_user.email}"
        li "#{current_admin_user.role}"
        li "#{current_admin_user.last_sign_in_at}"
        li "#{current_admin_user.created_at}"
       
      end
  end

end
