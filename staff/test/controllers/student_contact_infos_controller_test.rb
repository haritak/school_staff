require 'test_helper'

class StudentContactInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_contact_info = student_contact_infos(:one)
  end

  test "should get index" do
    get student_contact_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_student_contact_info_url
    assert_response :success
  end

  test "should create student_contact_info" do
    assert_difference('StudentContactInfo.count') do
      post student_contact_infos_url, params: { student_contact_info: { info: @student_contact_info.info, student_id: @student_contact_info.student_id, type: @student_contact_info.type } }
    end

    assert_redirected_to student_contact_info_url(StudentContactInfo.last)
  end

  test "should show student_contact_info" do
    get student_contact_info_url(@student_contact_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_contact_info_url(@student_contact_info)
    assert_response :success
  end

  test "should update student_contact_info" do
    patch student_contact_info_url(@student_contact_info), params: { student_contact_info: { info: @student_contact_info.info, student_id: @student_contact_info.student_id, type: @student_contact_info.type } }
    assert_redirected_to student_contact_info_url(@student_contact_info)
  end

  test "should destroy student_contact_info" do
    assert_difference('StudentContactInfo.count', -1) do
      delete student_contact_info_url(@student_contact_info)
    end

    assert_redirected_to student_contact_infos_url
  end
end
