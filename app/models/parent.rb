class Parent < ActiveRecord::Base
	has_many :families
	has_many :children, through: :families
 
	has_secure_password
    validates_confirmation_of :password
	validates_presence_of :password, :name, :email, on: :create
end
