require 'test_helper'

class BookedSlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get booked_slots_new_url
    assert_response :success
  end

  test "should get create" do
    get booked_slots_create_url
    assert_response :success
  end

end
