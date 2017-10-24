require 'test_helper'

class SchoolTeacherResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_teacher_response = school_teacher_responses(:one)
  end

  test "should get index" do
    get school_teacher_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_school_teacher_response_url
    assert_response :success
  end

  test "should create school_teacher_response" do
    assert_difference('SchoolTeacherResponse.count') do
      post school_teacher_responses_url, params: { school_teacher_response: { comments: @school_teacher_response.comments, decision_duration: @school_teacher_response.decision_duration, decision_no: @school_teacher_response.decision_no, decision_starting_date: @school_teacher_response.decision_starting_date, decision_year: @school_teacher_response.decision_year, protocol_date: @school_teacher_response.protocol_date, protocol_no: @school_teacher_response.protocol_no, response_completed: @school_teacher_response.response_completed, school_teacher_request_id: @school_teacher_response.school_teacher_request_id } }
    end

    assert_redirected_to school_teacher_response_url(SchoolTeacherResponse.last)
  end

  test "should show school_teacher_response" do
    get school_teacher_response_url(@school_teacher_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_teacher_response_url(@school_teacher_response)
    assert_response :success
  end

  test "should update school_teacher_response" do
    patch school_teacher_response_url(@school_teacher_response), params: { school_teacher_response: { comments: @school_teacher_response.comments, decision_duration: @school_teacher_response.decision_duration, decision_no: @school_teacher_response.decision_no, decision_starting_date: @school_teacher_response.decision_starting_date, decision_year: @school_teacher_response.decision_year, protocol_date: @school_teacher_response.protocol_date, protocol_no: @school_teacher_response.protocol_no, response_completed: @school_teacher_response.response_completed, school_teacher_request_id: @school_teacher_response.school_teacher_request_id } }
    assert_redirected_to school_teacher_response_url(@school_teacher_response)
  end

  test "should destroy school_teacher_response" do
    assert_difference('SchoolTeacherResponse.count', -1) do
      delete school_teacher_response_url(@school_teacher_response)
    end

    assert_redirected_to school_teacher_responses_url
  end
end
