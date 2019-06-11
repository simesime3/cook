require 'test_helper'

class MyImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_images_new_url
    assert_response :success
  end

end
