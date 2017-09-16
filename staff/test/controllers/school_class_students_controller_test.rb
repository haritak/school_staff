require 'test_helper'

class SchoolClassStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_class_student = school_class_students(:one)
  end

  test "should get index" do
    get school_class_students_url
    assert_response :success
  end

  test "should get new" do
    get new_school_class_student_url
    assert_response :success
  end

  test "should create school_class_student" do
    assert_difference('SchoolClassStudent.count') do
      post school_class_students_url, params: { school_class_student: { school_class_id: @school_class_student.school_class_id, school_student_id: @school_class_student.school_student_id } }
    end

    assert_redirected_to school_class_student_url(SchoolClassStudent.last)
  end

  test "should show school_class_student" do
    get school_class_student_url(@school_class_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_class_student_url(@school_class_student)
    assert_response :success
  end

  test "should update school_class_student" do
    patch school_class_student_url(@school_class_student), params: { school_class_student: { school_class_id: @school_class_student.school_class_id, school_student_id: @school_class_student.school_student_id } }
    assert_redirected_to school_class_student_url(@school_class_student)
  end

  test "should destroy school_class_student" do
    assert_difference('SchoolClassStudent.count', -1) do
      delete school_class_student_url(@school_class_student)
    end

    assert_redirected_to school_class_students_url
  end
end
