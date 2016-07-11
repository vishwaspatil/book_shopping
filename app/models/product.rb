class Product < ActiveRecord::Base


	has_many :line_items, dependent: :destroy
	has_many :carts , :through => :line_items 

	validates :title, :uniqueness => {:message =>  " already exsits"} , presence: true
    validates :description , presence: true
    validates :image_url , presence: true , format: {with: /\.(png|jpg)\Z/i}
    validates :price, :numericality => { :greater_than => 0.01  } 

    # validates :login, :email, presence: true
 
  before_destroy :destroy_of_product
 
  protected

    def destroy_of_product
       	if line_items.nil?
			return true
	    else
			errors.add(:Product_id, "Product id foreign key must exist")
		end
	end
	

end
