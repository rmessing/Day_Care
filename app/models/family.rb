# Family is a join table for child and parent.


class Family < ActiveRecord::Base
	belongs_to :child
	belongs_to :parent
end
