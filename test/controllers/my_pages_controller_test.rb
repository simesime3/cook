require 'test_helper'

class MyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_pages_new_url
    assert_response :success
  end

end
