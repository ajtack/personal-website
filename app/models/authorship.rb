class Authorship < ActiveRecord::Base
	belongs_to :author
	belongs_to :publication
	acts_as_list :scope => 'publication'
	
	validates_presence_of :author, :publication
end