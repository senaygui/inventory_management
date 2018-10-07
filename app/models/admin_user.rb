class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable

  has_many :material_requestions
  has_many :stocks
  has_many :purchase_requests
  has_many :return_requests

  # def rootadmin?
  # 	role == "RootAdmin"
  # end
  # def general_manager?
  # 	role == "GeneralManager"
  # end
  # def store_manager?
  # 	role == "StoreManager"
  # end
  # def Purchaser?
  # 	role == "Purchaser"
  # end
  # def requester?
  # 	role == "Requester"
  # end
end
