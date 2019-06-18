require 'test_helper'

class UserStoragesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_storages_new_url
    assert_response :success
  end

end
