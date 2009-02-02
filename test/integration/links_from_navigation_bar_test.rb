require 'test_helper'

class LinksFromNavigationBarTest < ActionController::IntegrationTest
	
	def setup
		visit about_url
		assert_select '#NavigationBar'
	end
	
	test 'header links to about me' do
		verify_existence_of_link_labeled 'About Me'
		click_link 'About Me'
		assert_template 'about/index'
	end

  test 'header links to publictions' do
		verify_existence_of_link_labeled 'Publications'
		click_link 'Publications'
		assert_template 'publications/index'
  end

	def verify_existence_of_link_labeled(label)
		assert_select 'a', {:text => label, :count => 1}
	end
	
end
