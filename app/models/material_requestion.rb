class MaterialRequestion < ApplicationRecord
	belongs_to :admin_user


	scope :pending, lambda { where(:general_manager_approval_status => "Pending") }
	scope :denied, lambda { where(:general_manager_approval_status => "Denied") }
	scope :accepted, lambda { where(:general_manager_approval_status => "Accepted") }
	scope :completed, lambda { where(:store_manager_request_status => "Completed") }
	scope :newest_first, lambda { order("material_requestions.created_at DESC")}
end
