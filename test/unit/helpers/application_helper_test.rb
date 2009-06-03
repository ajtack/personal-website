require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase	
	# This test documents a bug where the locale_independentize function
	# was actually modifying the parameter of page_title_for() function
	# such that the cv controller (which looks like a locale) would
	# eventually be pruned to a null URL.
	test 'page titles can be checked forever' do		
		path = '/en/cv'
		saved_path = path.clone
		assert_not_nil page_title_for(path), "Path #{saved_path} was pruned to nil on a single call to page_title_for"
		assert_not_nil page_title_for(path), "Path #{saved_path} was pruned to nil on the second call to page_title_for"
	end
end