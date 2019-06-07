require 'test_helper'

class TitlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get titles_new_url
    assert_response :success
  end

end
