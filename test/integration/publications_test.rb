require 'test_helper'

class PublicationsTest < ActionController::IntegrationTest

	test 'publications pages are properly titled'	do
		visit publications_path
		assert_select 'title', :text => /.? :: #{page_title_for(publications_path)}/
	end

	test 'all publications are listed' do
		visit publications_url
		verify_all_publications_shown
	end
	
	private
		def verify_all_publications_shown
			sorted_publications = Publication.all.sort
			assert_select 'ul#Publications' do
				assert_select 'li', {:count => Publication.count}, 'The wrong number of publications are listed' do
					assert_select 'p', {:text => sorted_publications.shift.to_bib}, 'Publications don\'t appear as expected (order? format?)'
				end
			end
		end
		
		def verify_title_says_publications
			assert_select 'title', :text => /.+ :: Publications/
		end

end
