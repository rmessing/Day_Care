class Child < ActiveRecord::Base
	has_many :meals
	has_many :handoffs
	has_many :families
	belongs_to :group
	has_many :parents, :through => :families
end
