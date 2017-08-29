require 'test_helper'

class TeacherSpecialtiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_specialty = teacher_specialties(:one)
  end

  test "should get index" do
    get teacher_specialties_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_specialty_url
    assert_response :success
  end

  test "should create teacher_specialty" do
    assert_difference('TeacherSpecialty.count') do
      post teacher_specialties_url, params: { teacher_specialty: { priority: @teacher_specialty.priority, specialty_id: @teacher_specialty.specialty_id, teacher_id: @teacher_specialty.teacher_id } }
    end

    assert_redirected_to teacher_specialty_url(TeacherSpecialty.last)
  end

  test "should show teacher_specialty" do
    get teacher_specialty_url(@teacher_specialty)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_specialty_url(@teacher_specialty)
    assert_response :success
  end

  test "should update teacher_specialty" do
    patch teacher_specialty_url(@teacher_specialty), params: { teacher_specialty: { priority: @teacher_specialty.priority, specialty_id: @teacher_specialty.specialty_id, teacher_id: @teacher_specialty.teacher_id } }
    assert_redirected_to teacher_specialty_url(@teacher_specialty)
  end

  test "should destroy teacher_specialty" do
    assert_difference('TeacherSpecialty.count', -1) do
      delete teacher_specialty_url(@teacher_specialty)
    end

    assert_redirected_to teacher_specialties_url
  end
end
