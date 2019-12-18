require 'test_helper'

class SlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get slots_create_url
    assert_response :success
  end

  test "should get update" do
    get slots_update_url
    assert_response :success
  end

end
