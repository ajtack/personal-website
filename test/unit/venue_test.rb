require 'test_helper'

class VenueTest < ActiveSupport::TestCase
	
	test 'venues must have names and dates' do
		assert_invalid_value Venue, :name, [nil, '']
		assert_invalid_value Venue, :date, nil
	end
	
	test 'venues have publications' do
		assert Venue.new.respond_to? :publications, 'Venues must be related to their publications'
		assert_equal 2, venues(:os_conference).publications.count
	end
	
end