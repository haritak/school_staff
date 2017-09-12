require 'test_helper'

class ScheduleControllerTest < ActionDispatch::IntegrationTest
  test "should get save" do
    get schedule_save_url
    assert_response :success
  end

  test "should get diff" do
    get schedule_diff_url
    assert_response :success
  end

end
