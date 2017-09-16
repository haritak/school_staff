require 'test_helper'

class StudentPersonalMobilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_personal_mobile = student_personal_mobiles(:one)
  end

  test "should get index" do
    get student_personal_mobiles_url
    assert_response :success
  end

  test "should get new" do
    get new_student_personal_mobile_url
    assert_response :success
  end

  test "should create student_personal_mobile" do
    assert_difference('StudentPersonalMobile.count') do
      post student_personal_mobiles_url, params: { student_personal_mobile: {  } }
    end

    assert_redirected_to student_personal_mobile_url(StudentPersonalMobile.last)
  end

  test "should show student_personal_mobile" do
    get student_personal_mobile_url(@student_personal_mobile)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_personal_mobile_url(@student_personal_mobile)
    assert_response :success
  end

  test "should update student_personal_mobile" do
    patch student_personal_mobile_url(@student_personal_mobile), params: { student_personal_mobile: {  } }
    assert_redirected_to student_personal_mobile_url(@student_personal_mobile)
  end

  test "should destroy student_personal_mobile" do
    assert_difference('StudentPersonalMobile.count', -1) do
      delete student_personal_mobile_url(@student_personal_mobile)
    end

    assert_redirected_to student_personal_mobiles_url
  end
end
