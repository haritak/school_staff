require 'test_helper'

class SchoolStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_student = school_students(:one)
  end

  test "should get index" do
    get school_students_url
    assert_response :success
  end

  test "should get new" do
    get new_school_student_url
    assert_response :success
  end

  test "should create school_student" do
    assert_difference('SchoolStudent.count') do
      post school_students_url, params: { school_student: { registry_no: @school_student.registry_no, school_id: @school_student.school_id, student_id: @school_student.student_id } }
    end

    assert_redirected_to school_student_url(SchoolStudent.last)
  end

  test "should show school_student" do
    get school_student_url(@school_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_student_url(@school_student)
    assert_response :success
  end

  test "should update school_student" do
    patch school_student_url(@school_student), params: { school_student: { registry_no: @school_student.registry_no, school_id: @school_student.school_id, student_id: @school_student.student_id } }
    assert_redirected_to school_student_url(@school_student)
  end

  test "should destroy school_student" do
    assert_difference('SchoolStudent.count', -1) do
      delete school_student_url(@school_student)
    end

    assert_redirected_to school_students_url
  end
end
