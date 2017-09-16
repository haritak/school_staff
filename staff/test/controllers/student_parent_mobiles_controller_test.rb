require 'test_helper'

class StudentParentMobilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_parent_mobile = student_parent_mobiles(:one)
  end

  test "should get index" do
    get student_parent_mobiles_url
    assert_response :success
  end

  test "should get new" do
    get new_student_parent_mobile_url
    assert_response :success
  end

  test "should create student_parent_mobile" do
    assert_difference('StudentParentMobile.count') do
      post student_parent_mobiles_url, params: { student_parent_mobile: {  } }
    end

    assert_redirected_to student_parent_mobile_url(StudentParentMobile.last)
  end

  test "should show student_parent_mobile" do
    get student_parent_mobile_url(@student_parent_mobile)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_parent_mobile_url(@student_parent_mobile)
    assert_response :success
  end

  test "should update student_parent_mobile" do
    patch student_parent_mobile_url(@student_parent_mobile), params: { student_parent_mobile: {  } }
    assert_redirected_to student_parent_mobile_url(@student_parent_mobile)
  end

  test "should destroy student_parent_mobile" do
    assert_difference('StudentParentMobile.count', -1) do
      delete student_parent_mobile_url(@student_parent_mobile)
    end

    assert_redirected_to student_parent_mobiles_url
  end
end
