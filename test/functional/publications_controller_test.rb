require 'test_helper'

class PublicationsControllerTest < ActionController::TestCase
	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:publications)
		assert_equal Publication.all.sort, assigns(:publications)
	end
end
