require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get colors" do
    get :colors
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get products" do
    get :products
    assert_response :success
  end

  test "should get categories" do
    get :categories
    assert_response :success
  end

end
