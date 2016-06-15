class Center < ActiveRecord::Base
	has_many :teachers
	
	has_secure_password
    validates_confirmation_of :password
	validates_presence_of :password, on: :create
end
