require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	
	test 'authors must have first and last names' do
		assert Author.new.respond_to? :first_name, 'Author must respond to .first_name'
		assert Author.new.respond_to? :last_name, 'Author must respond to .last_name'
		assert_invalid_attributes Author, :first_name => [nil, ''], :last_name => [nil, '']
	end
	
	test 'authors have publications' do
		assert Author.new.respond_to? :publications, 'An author should relate to publications'
	end
	
end