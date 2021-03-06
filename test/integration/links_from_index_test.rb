require 'test_helper'

class LinksFromIndexTest < ActionController::IntegrationTest

	test 'index links to about me' do
		visit root_url
		verify_existence_of_link_labeled 'About Me'
		click_link 'About Me'
		assert_template 'about/index'
	end

  test 'index links to publictions' do
  	visit root_url
		verify_existence_of_link_labeled 'Publications'
		click_link 'Publications'
		assert_template 'publications/index'
  end

	def verify_existence_of_link_labeled(label)
		assert_select 'a', {:text => label, :count => 1}
	end

end
