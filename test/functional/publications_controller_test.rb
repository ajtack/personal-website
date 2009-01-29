require 'test_helper'

class PublicationsControllerTest < ActionController::TestCase
	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:publications)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create publication" do
		title = 'A New Publication!'
		venue = venues(:one)
		assert_difference('Publication.count') do
			post :create, :publication => {
				:title => title,
				:venue => venue
			}
		end

		assert_not_nil assigns(:publication)
		assert_equal title, assigns(:publication).title
		assert_equal venue, assigns(:publication).venue
		assert_redirected_to publication_path(assigns(:publication))
	end

	test "should show publication" do
		get :show, :id => publications(:one).id
		assert_response :success
	end

	test "should get edit" do
		get :edit, :id => publications(:one).id
		assert_response :success
	end

  test "should update publication" do
		new_title = "A New Publication Title"
		new_venue = venues(:os_conference)
		put :update, :id => publications(:one).id, :publication => {
			:title => new_title,
			:venue => new_venue
		}
		
		assert_not_nil assigns(:publication)
		assert_equal new_title, assigns(:publication).title
		assert_equal new_venue, assigns(:publication).venue
		assert_redirected_to publication_path(assigns(:publication))
  end

	test "should destroy publication" do
		assert_difference('Publication.count', -1) do
			delete :destroy, :id => publications(:one).id
		end

		assert_redirected_to publications_path
	end
end
