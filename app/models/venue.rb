class Venue < ActiveRecord::Base
	has_many :publications
	
	validates_presence_of :name
	validates_presence_of :date
end