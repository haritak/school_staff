require 'test_helper'

class SchoolyearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schoolyear = schoolyears(:one)
  end

  test "should get index" do
    get schoolyears_url
    assert_response :success
  end

  test "should get new" do
    get new_schoolyear_url
    assert_response :success
  end

  test "should create schoolyear" do
    assert_difference('Schoolyear.count') do
      post schoolyears_url, params: { schoolyear: { startingyear: @schoolyear.startingyear } }
    end

    assert_redirected_to schoolyear_url(Schoolyear.last)
  end

  test "should show schoolyear" do
    get schoolyear_url(@schoolyear)
    assert_response :success
  end

  test "should get edit" do
    get edit_schoolyear_url(@schoolyear)
    assert_response :success
  end

  test "should update schoolyear" do
    patch schoolyear_url(@schoolyear), params: { schoolyear: { startingyear: @schoolyear.startingyear } }
    assert_redirected_to schoolyear_url(@schoolyear)
  end

  test "should destroy schoolyear" do
    assert_difference('Schoolyear.count', -1) do
      delete schoolyear_url(@schoolyear)
    end

    assert_redirected_to schoolyears_url
  end
end
