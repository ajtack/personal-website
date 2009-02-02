class Publication < ActiveRecord::Base
	has_many :authorships, :order => :position
	has_many :authors, :through => :authorships, :order => 'authorships.position'
	belongs_to :venue
	
	validates_presence_of :title
	validates_presence_of :venue
	
	include Comparable
	
	def date
		venue.date
	end
	
	def to_bib
		title_and_venue = "#{title}. #{venue.name}, #{venue.date}."
		
		case authors.length
		when 0:
			title_and_venue
		when 1:
			"#{authors.first}. #{title_and_venue}"
		else
			"#{authors[0...-1].join(', ')} #{I18n.t(:and)} #{authors.last}. #{title_and_venue}"
		end
	end
	
	def <=>(other)
		if other.kind_of? Publication
			other.date <=> self.date
		else
			raise NoMethodError, "#{self.class.name} doesn't know how to compare with #{other.class.name}."
		end
	end
end
