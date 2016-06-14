class Group < ActiveRecord::
	has_many :children
	belongs_to :teacher
end
