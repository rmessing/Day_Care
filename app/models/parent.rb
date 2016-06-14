class Parent < ActiveRecord::Base
	has_many :children, :through => :family
end
