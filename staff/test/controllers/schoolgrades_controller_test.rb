require 'test_helper'

class SchoolgradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schoolgrade = schoolgrades(:one)
  end

  test "should get index" do
    get schoolgrades_url
    assert_response :success
  end

  test "should get new" do
    get new_schoolgrade_url
    assert_response :success
  end

  test "should create schoolgrade" do
    assert_difference('Schoolgrade.count') do
      post schoolgrades_url, params: { schoolgrade: { code: @schoolgrade.code, description: @schoolgrade.description } }
    end

    assert_redirected_to schoolgrade_url(Schoolgrade.last)
  end

  test "should show schoolgrade" do
    get schoolgrade_url(@schoolgrade)
    assert_response :success
  end

  test "should get edit" do
    get edit_schoolgrade_url(@schoolgrade)
    assert_response :success
  end

  test "should update schoolgrade" do
    patch schoolgrade_url(@schoolgrade), params: { schoolgrade: { code: @schoolgrade.code, description: @schoolgrade.description } }
    assert_redirected_to schoolgrade_url(@schoolgrade)
  end

  test "should destroy schoolgrade" do
    assert_difference('Schoolgrade.count', -1) do
      delete schoolgrade_url(@schoolgrade)
    end

    assert_redirected_to schoolgrades_url
  end
end
