class PurchaseRequest < ApplicationRecord
	belongs_to :admin_user


	scope :pending, lambda { where(:purchaser_approval => "Pending") }
	scope :denied, lambda { where(:purchaser_approval => "Denied") }
	scope :accepted, lambda { where(:purchaser_approval => "Accepted") }
	scope :newest_first, lambda { order("created_at DESC")}
end
