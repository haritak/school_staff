require 'test_helper'

class SchoolClassLessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_class_lesson = school_class_lessons(:one)
  end

  test "should get index" do
    get school_class_lessons_url
    assert_response :success
  end

  test "should get new" do
    get new_school_class_lesson_url
    assert_response :success
  end

  test "should create school_class_lesson" do
    assert_difference('SchoolClassLesson.count') do
      post school_class_lessons_url, params: { school_class_lesson: { lesson_id: @school_class_lesson.lesson_id, school_class_id: @school_class_lesson.school_class_id } }
    end

    assert_redirected_to school_class_lesson_url(SchoolClassLesson.last)
  end

  test "should show school_class_lesson" do
    get school_class_lesson_url(@school_class_lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_class_lesson_url(@school_class_lesson)
    assert_response :success
  end

  test "should update school_class_lesson" do
    patch school_class_lesson_url(@school_class_lesson), params: { school_class_lesson: { lesson_id: @school_class_lesson.lesson_id, school_class_id: @school_class_lesson.school_class_id } }
    assert_redirected_to school_class_lesson_url(@school_class_lesson)
  end

  test "should destroy school_class_lesson" do
    assert_difference('SchoolClassLesson.count', -1) do
      delete school_class_lesson_url(@school_class_lesson)
    end

    assert_redirected_to school_class_lessons_url
  end
end
