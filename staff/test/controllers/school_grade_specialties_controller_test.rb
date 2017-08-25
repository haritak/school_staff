require 'test_helper'

class SchoolGradeSpecialtiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_grade_specialty = school_grade_specialties(:one)
  end

  test "should get index" do
    get school_grade_specialties_url
    assert_response :success
  end

  test "should get new" do
    get new_school_grade_specialty_url
    assert_response :success
  end

  test "should create school_grade_specialty" do
    assert_difference('SchoolGradeSpecialty.count') do
      post school_grade_specialties_url, params: { school_grade_specialty: { code: @school_grade_specialty.code, description: @school_grade_specialty.description, schoolgrade_id: @school_grade_specialty.schoolgrade_id } }
    end

    assert_redirected_to school_grade_specialty_url(SchoolGradeSpecialty.last)
  end

  test "should show school_grade_specialty" do
    get school_grade_specialty_url(@school_grade_specialty)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_grade_specialty_url(@school_grade_specialty)
    assert_response :success
  end

  test "should update school_grade_specialty" do
    patch school_grade_specialty_url(@school_grade_specialty), params: { school_grade_specialty: { code: @school_grade_specialty.code, description: @school_grade_specialty.description, schoolgrade_id: @school_grade_specialty.schoolgrade_id } }
    assert_redirected_to school_grade_specialty_url(@school_grade_specialty)
  end

  test "should destroy school_grade_specialty" do
    assert_difference('SchoolGradeSpecialty.count', -1) do
      delete school_grade_specialty_url(@school_grade_specialty)
    end

    assert_redirected_to school_grade_specialties_url
  end
end
