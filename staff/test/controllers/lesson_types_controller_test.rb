require 'test_helper'

class LessonTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_type = lesson_types(:one)
  end

  test "should get index" do
    get lesson_types_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_type_url
    assert_response :success
  end

  test "should create lesson_type" do
    assert_difference('LessonType.count') do
      post lesson_types_url, params: { lesson_type: { code: @lesson_type.code, description: @lesson_type.description } }
    end

    assert_redirected_to lesson_type_url(LessonType.last)
  end

  test "should show lesson_type" do
    get lesson_type_url(@lesson_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_type_url(@lesson_type)
    assert_response :success
  end

  test "should update lesson_type" do
    patch lesson_type_url(@lesson_type), params: { lesson_type: { code: @lesson_type.code, description: @lesson_type.description } }
    assert_redirected_to lesson_type_url(@lesson_type)
  end

  test "should destroy lesson_type" do
    assert_difference('LessonType.count', -1) do
      delete lesson_type_url(@lesson_type)
    end

    assert_redirected_to lesson_types_url
  end
end
