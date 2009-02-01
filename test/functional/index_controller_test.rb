require 'test_helper'

class IndexControllerTest < ActionController::TestCase
	test 'index' do
		get :index
		assert_response :success
		assert_template :index
	end
end
