class Child < ActiveRecord::Base
	has_many :meals
	has_many :handoffs
	belongs_to :group
	has_many :families
	has_many :parents, :through => :families, dependent: :destroy
	
end
