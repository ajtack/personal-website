require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test 'index' do
  	get :index
		assert_response :success
  end
end
