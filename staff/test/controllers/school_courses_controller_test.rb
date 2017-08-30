require 'test_helper'

class SchoolCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_course = school_courses(:one)
  end

  test "should get index" do
    get school_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_school_course_url
    assert_response :success
  end

  test "should create school_course" do
    assert_difference('SchoolCourse.count') do
      post school_courses_url, params: { school_course: { duration: @school_course.duration, lesson_id: @school_course.lesson_id, school_class_id: @school_course.school_class_id } }
    end

    assert_redirected_to school_course_url(SchoolCourse.last)
  end

  test "should show school_course" do
    get school_course_url(@school_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_course_url(@school_course)
    assert_response :success
  end

  test "should update school_course" do
    patch school_course_url(@school_course), params: { school_course: { duration: @school_course.duration, lesson_id: @school_course.lesson_id, school_class_id: @school_course.school_class_id } }
    assert_redirected_to school_course_url(@school_course)
  end

  test "should destroy school_course" do
    assert_difference('SchoolCourse.count', -1) do
      delete school_course_url(@school_course)
    end

    assert_redirected_to school_courses_url
  end
end
