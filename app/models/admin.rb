class Admin < ActiveRecord::Base
  has_secure_password

  attr_accessor :password_confirmation
  validates :name, :presence =>true,
                    :uniqueness=>true
  validates :password, :presence =>true,
                    :length => { :minimum => 5, :maximum => 40 }
                    
  
end
