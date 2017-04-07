require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get product_new" do
    get :product_new
    assert_response :success
  end

end
