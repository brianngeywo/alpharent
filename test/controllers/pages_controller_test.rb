require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get buy" do
    get pages_buy_url
    assert_response :success
  end

  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get about_us" do
    get pages_about_us_url
    assert_response :success
  end

  test "should get prop_details" do
    get pages_prop_details_url
    assert_response :success
  end

  test "should get request_listing" do
    get pages_request_listing_url
    assert_response :success
  end

end
