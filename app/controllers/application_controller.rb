class ApplicationController < ActionController::Base
  def access_denied(exception)
    redirect_to admin_organizations_path, alert: exception.message
  end
  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
   end

  # check_authorization unless: :activeadmin_resource?
  
  # private

  # def activeadmin_resource?
  #   self.class.ancestors.include? ActiveAdmin::BaseController
  # end
end
