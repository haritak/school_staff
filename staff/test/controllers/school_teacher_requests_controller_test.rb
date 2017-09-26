require 'test_helper'

class SchoolTeacherRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_teacher_request = school_teacher_requests(:one)
  end

  test "should get index" do
    get school_teacher_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_school_teacher_request_url
    assert_response :success
  end

  test "should create school_teacher_request" do
    assert_difference('SchoolTeacherRequest.count') do
      post school_teacher_requests_url, params: { school_teacher_request: { filename: @school_teacher_request.filename, request_specification_id: @school_teacher_request.request_specification_id, school_teacher_id: @school_teacher_request.school_teacher_id } }
    end

    assert_redirected_to school_teacher_request_url(SchoolTeacherRequest.last)
  end

  test "should show school_teacher_request" do
    get school_teacher_request_url(@school_teacher_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_teacher_request_url(@school_teacher_request)
    assert_response :success
  end

  test "should update school_teacher_request" do
    patch school_teacher_request_url(@school_teacher_request), params: { school_teacher_request: { filename: @school_teacher_request.filename, request_specification_id: @school_teacher_request.request_specification_id, school_teacher_id: @school_teacher_request.school_teacher_id } }
    assert_redirected_to school_teacher_request_url(@school_teacher_request)
  end

  test "should destroy school_teacher_request" do
    assert_difference('SchoolTeacherRequest.count', -1) do
      delete school_teacher_request_url(@school_teacher_request)
    end

    assert_redirected_to school_teacher_requests_url
  end
end
