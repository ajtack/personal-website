require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
	
	test 'must have title' do
		assert Publication.new.respond_to? :title
		assert_invalid_value Publication, :title, nil
	end
	
	test 'must have venue' do
		assert Publication.new.respond_to? :venue
		assert_invalid_value Publication, :venue, nil
	end
	
	test 'must have authors' do
		assert Publication.new.respond_to? :authors
		assert_invalid_value Publication, :authors, []
	end
	
	test 'has bibliograpy form' do
		assert Publication.new.respond_to? :to_bib
		assert_equal "Andres Jaan Tack and Haris Volos. A Scheduling Paper. Operating Systems Conference, #{Date.yesterday.strftime("%B, %Y")}.", publications(:scheduling_paper).to_bib
		assert_equal "Remzi Arpaci-Dusseau. A File Systems Paper. Operating Systems Conference, #{Date.yesterday.strftime("%B, %Y")}.", publications(:file_systems_paper).to_bib
	end
	
	test 'publication date is from venue' do
		assert Publication.new.respond_to?(:date), 'Publication doesn\'t have a date method'
		publication = Publication.first
		assert_equal publication.venue.date, publication.date
	end
	
	test 'sorts in reverse by date' do
		assert Publication.new.respond_to?('<=>'), 'Cannot sort publications; there is no <=> method'
		
		sorted_pubs = Publication.all.sort
		message = ["Publications sorted as: <?>, which is not in reverse date order.\n",
			sorted_pubs.collect do |p|
				"#{p.title} (#{p.date})"
			end.to_s
		]
		
		assert_block message do
			fail = false
			sorted_pubs.each_index do |i|
				unless i == 0
					if sorted_pubs[i-1].date < sorted_pubs[i].date
						fail = true
						break
					end
				end
			end
			
			not fail
		end
	end
	
end