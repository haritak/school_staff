require 'test_helper'

class SavedSchoolCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_school_course = saved_school_courses(:one)
  end

  test "should get index" do
    get saved_school_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_school_course_url
    assert_response :success
  end

  test "should create saved_school_course" do
    assert_difference('SavedSchoolCourse.count') do
      post saved_school_courses_url, params: { saved_school_course: { duration: @saved_school_course.duration, lesson_id: @saved_school_course.lesson_id, save_no: @saved_school_course.save_no, school_class_id: @saved_school_course.school_class_id } }
    end

    assert_redirected_to saved_school_course_url(SavedSchoolCourse.last)
  end

  test "should show saved_school_course" do
    get saved_school_course_url(@saved_school_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_school_course_url(@saved_school_course)
    assert_response :success
  end

  test "should update saved_school_course" do
    patch saved_school_course_url(@saved_school_course), params: { saved_school_course: { duration: @saved_school_course.duration, lesson_id: @saved_school_course.lesson_id, save_no: @saved_school_course.save_no, school_class_id: @saved_school_course.school_class_id } }
    assert_redirected_to saved_school_course_url(@saved_school_course)
  end

  test "should destroy saved_school_course" do
    assert_difference('SavedSchoolCourse.count', -1) do
      delete saved_school_course_url(@saved_school_course)
    end

    assert_redirected_to saved_school_courses_url
  end
end
