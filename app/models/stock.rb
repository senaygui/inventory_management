class Stock < ApplicationRecord
	belongs_to :admin_user

	scope :newest_first, lambda { order("stocks.created_at DESC")}
end
