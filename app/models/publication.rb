class Publication < ActiveRecord::Base
	has_many :authorships
	has_many :authors, :through => :authorships
	belongs_to :venue
	
	validates_presence_of :title
	validates_presence_of :venue
end
