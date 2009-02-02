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
	
	test 'paper has correctly-ordered authors' do
		scheduling_paper_authors = [authors(:tack), authors(:haris)]
		assert_equal scheduling_paper_authors.length, publications(:scheduling_paper).authors.count
		assert_equal scheduling_paper_authors, publications(:scheduling_paper).authors
		
		paper_one_authors = [authors(:haris), authors(:tack)]
		assert_equal paper_one_authors.length, publications(:one).authors.count
		assert_equal paper_one_authors, publications(:one).authors
	end
	
	test 'authors are printed first name first' do
		assert_equal 'Andres Jaan Tack', authors(:tack).to_s
	end
	
end