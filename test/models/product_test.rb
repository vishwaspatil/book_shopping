require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "should have the neccassary attribute " do
		  product=Product.new(title: 'vishwas' , description: 'vishwas patil' , image_url: ''  , price: '')
		  assert_not  product.valid?
		  assert_equal [:title , :description , :image_url , :price], product.errors.full_messages
	end
	test "product price must be positive " do
		  product=Product.new(title: 'vishwas123' , description: 'vishwas patil323' , image_url: 'vishwas.jpg'  , price: '-1')
		  assert_not  product.valid?
		  assert_equal [:title , :description , :image_url , :price], product.errors.full_messages
	end

	
	def new_product(image_url)
  		Product.new(title: "My Book Title",
               		description: "yyy",
               		price: 1,
               		image_url:   image_url)
	end

	test "image url" do
  		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
        	 http://a.b.c/x/y/z/fred.gif }
  		bad = %w{ fred.doc fred.gif/more fred.gif.more }

  		ok.each do |name|
    	assert new_product(name).valid?, "#{name} shouldn't be invalid"
  		end

  		bad.each do |name|
    	assert new_product(name).invalid?, "#{name} shouldn't be valid"
  		end
	end


	test "product is not valid without a unique title - i18n" do
    product = Product.new(:title => products(:value1).title,
                          :description => "yyy",
                          :price => 1,
                          :image_url => "fred.gif")

    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'), product.errors[:title].join('; ')
  end  
end
