require 'test_helper'

class PublicationsTest < ActionController::IntegrationTest
	test 'publications pages are properly titled'	do
		visit publications_path
		verify_title_says_publications
	end

	test 'all publications are listed' do
		visit publications_url
		verify_all_publications_shown
	end
	
	private
		def verify_all_publications_shown
			assert_select 'ul#Publications' do
				assert_select 'li', :count => Publication.count
			end
		end
		
		def verify_title_says_publications
			assert_select 'title', :text => /.+ :: Publications/
		end
end
