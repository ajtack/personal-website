class Author < ActiveRecord::Base
	has_many :authorships
	has_many :publications, :through => :authorships
	
	validates_presence_of :first_name, :last_name
	
	def to_s
		unless middle_names.nil?
			"#{first_name} #{middle_names} #{last_name}"
		else
			"#{first_name} #{last_name}"
		end
	end
end