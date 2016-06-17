class Meal < ActiveRecord::Base
	belongs_to :child
	belongs_to :teacher
end
