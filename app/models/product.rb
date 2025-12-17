class Product < ApplicationRecord
	validates :name , presence:true
	self.primary_key = [:email, :name]
end
