class Authorship < ActiveRecord::Base
	belongs_to :author
	belongs_to :publication
	
	validates_presence_of :author, :publication
end