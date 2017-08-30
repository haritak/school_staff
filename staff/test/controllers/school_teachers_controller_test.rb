require 'test_helper'

class SchoolTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_teacher = school_teachers(:one)
  end

  test "should get index" do
    get school_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_school_teacher_url
    assert_response :success
  end

  test "should create school_teacher" do
    assert_difference('SchoolTeacher.count') do
      post school_teachers_url, params: { school_teacher: { disposal_duration: @school_teacher.disposal_duration, school_id: @school_teacher.school_id, teacher_id: @school_teacher.teacher_id } }
    end

    assert_redirected_to school_teacher_url(SchoolTeacher.last)
  end

  test "should show school_teacher" do
    get school_teacher_url(@school_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_teacher_url(@school_teacher)
    assert_response :success
  end

  test "should update school_teacher" do
    patch school_teacher_url(@school_teacher), params: { school_teacher: { disposal_duration: @school_teacher.disposal_duration, school_id: @school_teacher.school_id, teacher_id: @school_teacher.teacher_id } }
    assert_redirected_to school_teacher_url(@school_teacher)
  end

  test "should destroy school_teacher" do
    assert_difference('SchoolTeacher.count', -1) do
      delete school_teacher_url(@school_teacher)
    end

    assert_redirected_to school_teachers_url
  end
end
