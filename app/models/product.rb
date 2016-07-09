class Product < ActiveRecord::Base
	validates_presence_of :title , :message => "can't be blank"
	validates_presence_of :description, :message => "can't be blank"
	validates_presence_of :image_url, :message => "can't be blank"
	validates_presence_of :price, :message => "can't be blank"	
	validates_numericality_of :price, :greater_than => 0.01, :message => "can be greater_than or equal_to 0.01"
	validates :title, :uniqueness => {:message => "Title already exists."}
	validates :image_url, format: {with: /\.(png|jpg)\Z/i}

end
