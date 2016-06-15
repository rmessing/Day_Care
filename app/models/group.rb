class Group < ActiveRecord::Base
	has_many :children
	belongs_to :teacher
end
