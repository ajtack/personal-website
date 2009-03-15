require 'test_helper'

class AboutTest < ActionController::IntegrationTest
	
	test 'about pages are properly titled'	do
		visit about_path
		assert_select 'title', :text => /.+ :: #{page_title_for(about_path)}/
	end
	
	test 'about title' do
		visit about_path
		assert_select '#Content > h1', :text => t('page_titles.about_me')
	end
	
end
