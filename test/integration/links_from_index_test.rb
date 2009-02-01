require 'test_helper'

class LinksFromIndexTest < ActionController::IntegrationTest

  test 'index links to publictions' do
  	visit root_url
		verify_existence_of_publications_link
		click_link 'Publications'
		assert_template 'publications/index'
  end

	def verify_existence_of_publications_link
		assert_select 'a', {:text => 'Publications', :count => 1}
	end

end
