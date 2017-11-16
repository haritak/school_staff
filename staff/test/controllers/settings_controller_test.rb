require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setting = settings(:one)
  end

  test "should get index" do
    get settings_url
    assert_response :success
  end

  test "should get new" do
    get new_setting_url
    assert_response :success
  end

  test "should create setting" do
    assert_difference('Setting.count') do
      post settings_url, params: { setting: { adeies_email: @setting.adeies_email, mng_email: @setting.mng_email, school_id: @setting.school_id, ypo1_email: @setting.ypo1_email, ypo2_email: @setting.ypo2_email } }
    end

    assert_redirected_to setting_url(Setting.last)
  end

  test "should show setting" do
    get setting_url(@setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_setting_url(@setting)
    assert_response :success
  end

  test "should update setting" do
    patch setting_url(@setting), params: { setting: { adeies_email: @setting.adeies_email, mng_email: @setting.mng_email, school_id: @setting.school_id, ypo1_email: @setting.ypo1_email, ypo2_email: @setting.ypo2_email } }
    assert_redirected_to setting_url(@setting)
  end

  test "should destroy setting" do
    assert_difference('Setting.count', -1) do
      delete setting_url(@setting)
    end

    assert_redirected_to settings_url
  end
end
