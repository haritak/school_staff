require 'test_helper'

class SchoolCourseTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_course_teacher = school_course_teachers(:one)
  end

  test "should get index" do
    get school_course_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_school_course_teacher_url
    assert_response :success
  end

  test "should create school_course_teacher" do
    assert_difference('SchoolCourseTeacher.count') do
      post school_course_teachers_url, params: { school_course_teacher: { school_course_id: @school_course_teacher.school_course_id, teacher_id: @school_course_teacher.teacher_id } }
    end

    assert_redirected_to school_course_teacher_url(SchoolCourseTeacher.last)
  end

  test "should show school_course_teacher" do
    get school_course_teacher_url(@school_course_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_course_teacher_url(@school_course_teacher)
    assert_response :success
  end

  test "should update school_course_teacher" do
    patch school_course_teacher_url(@school_course_teacher), params: { school_course_teacher: { school_course_id: @school_course_teacher.school_course_id, teacher_id: @school_course_teacher.teacher_id } }
    assert_redirected_to school_course_teacher_url(@school_course_teacher)
  end

  test "should destroy school_course_teacher" do
    assert_difference('SchoolCourseTeacher.count', -1) do
      delete school_course_teacher_url(@school_course_teacher)
    end

    assert_redirected_to school_course_teachers_url
  end
end
