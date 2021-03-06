class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= AdminUser.new   
        
    case user.role      
    when "RootAdmin"
        can :manage, AdminUser 
        can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
        can :manage, ActiveAdmin::Comment
    when "GeneralManager"
        can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
        can :manage, MaterialRequestion
        cannot :update, MaterialRequestion , general_manager_approval_status: "Accepted"
        cannot :create, MaterialRequestion
        cannot :destroy, MaterialRequestion     
    when "StoreManager"
        can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
        can :manage, Stock
        can :manage, MaterialRequestion, general_manager_approval_status: "Accepted"
        cannot :update, MaterialRequestion, store_manager_request_status: "Completed"  
        cannot :create, MaterialRequestion
        cannot :destroy, MaterialRequestion 
        can :create, PurchaseRequest
        can :read, PurchaseRequest
        cannot :update, PurchaseRequest, purchaser_approval: "Accepted"  
        cannot :destroy, PurchaseRequest, purchaser_approval: "Accepted"  

        
        can :read, ReturnRequest 
        can :update, ReturnRequest  
        cannot :update, ReturnRequest, sm_confirmation: "Completed"
        cannot :destroy, ReturnRequest 
    when "Purchaser"
        can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin" 
        can :manage, PurchaseRequest
        cannot :update, PurchaseRequest, purchaser_approval: "Completed"  
        cannot :create, PurchaseRequest
        cannot :destroy, PurchaseRequest     
    when "Employee"
        can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
        can :create, MaterialRequestion 
        can :read, MaterialRequestion , admin_user_id: user.id
        can :update, MaterialRequestion , admin_user_id: user.id, general_manager_approval_status: "Pending"
        can :destroy, MaterialRequestion, admin_user_id: user.id, general_manager_approval_status: "Pending"

        can :create, ReturnRequest 
        can :read, ReturnRequest , admin_user_id: user.id
        can :update, ReturnRequest , admin_user_id: user.id, sm_confirmation: "Pending"
        can :destroy, ReturnRequest, admin_user_id: user.id, sm_confirmation: "Pending"
    end
  end
end

    # can :read, User
     # can :manage, AdminUser, id: user.id
     # can :manage, :all
    # can :manage, :all
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities