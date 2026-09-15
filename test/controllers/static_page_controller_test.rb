require "test_helper"

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get static_page_new_url
    assert_response :success
  end

  test "should get create" do
    get static_page_create_url
    assert_response :success
  end

  test "should get show" do
    get static_page_show_url
    assert_response :success
  end
end
