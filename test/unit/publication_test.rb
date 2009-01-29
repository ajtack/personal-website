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
end