class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	PAYMENT = ['check', 'credit card', 'purchase order']
	
	validates :name, :email, :address, :pay_type,  presence:  :true
end
