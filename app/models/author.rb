class Author < ActiveRecord::Base
	has_many :authorships
	has_many :publications, :through => :authorships
	
	validates_presence_of :first_name, :last_name
end