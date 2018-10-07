class ReturnRequest < ApplicationRecord
	belongs_to :admin_user

	scope :pending, lambda { where(:sm_confirmation => "Pending") }
	scope :denied, lambda { where(:sm_confirmation => "Denied") }
	scope :accepted, lambda { where(:sm_confirmation => "Accepted") }
	scope :completed, lambda { where(:sm_confirmation => "Completed") }
	scope :newest_first, lambda { order("created_at DESC")}
end
