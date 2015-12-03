require 'test_helper'

class FavoritePostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
