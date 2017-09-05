require 'test_helper'

class SavedSchoolCourseTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_school_course_teacher = saved_school_course_teachers(:one)
  end

  test "should get index" do
    get saved_school_course_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_school_course_teacher_url
    assert_response :success
  end

  test "should create saved_school_course_teacher" do
    assert_difference('SavedSchoolCourseTeacher.count') do
      post saved_school_course_teachers_url, params: { saved_school_course_teacher: { save_no: @saved_school_course_teacher.save_no, saved_school_course_id: @saved_school_course_teacher.saved_school_course_id, school_teacher_id: @saved_school_course_teacher.school_teacher_id } }
    end

    assert_redirected_to saved_school_course_teacher_url(SavedSchoolCourseTeacher.last)
  end

  test "should show saved_school_course_teacher" do
    get saved_school_course_teacher_url(@saved_school_course_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_school_course_teacher_url(@saved_school_course_teacher)
    assert_response :success
  end

  test "should update saved_school_course_teacher" do
    patch saved_school_course_teacher_url(@saved_school_course_teacher), params: { saved_school_course_teacher: { save_no: @saved_school_course_teacher.save_no, saved_school_course_id: @saved_school_course_teacher.saved_school_course_id, school_teacher_id: @saved_school_course_teacher.school_teacher_id } }
    assert_redirected_to saved_school_course_teacher_url(@saved_school_course_teacher)
  end

  test "should destroy saved_school_course_teacher" do
    assert_difference('SavedSchoolCourseTeacher.count', -1) do
      delete saved_school_course_teacher_url(@saved_school_course_teacher)
    end

    assert_redirected_to saved_school_course_teachers_url
  end
end
