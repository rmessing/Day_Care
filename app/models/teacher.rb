class Teacher < ActiveRecord::Base
	has_one :group
	belongs_to :center
end
