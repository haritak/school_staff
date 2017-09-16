require 'test_helper'

class StudentResidenceTownsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_residence_town = student_residence_towns(:one)
  end

  test "should get index" do
    get student_residence_towns_url
    assert_response :success
  end

  test "should get new" do
    get new_student_residence_town_url
    assert_response :success
  end

  test "should create student_residence_town" do
    assert_difference('StudentResidenceTown.count') do
      post student_residence_towns_url, params: { student_residence_town: {  } }
    end

    assert_redirected_to student_residence_town_url(StudentResidenceTown.last)
  end

  test "should show student_residence_town" do
    get student_residence_town_url(@student_residence_town)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_residence_town_url(@student_residence_town)
    assert_response :success
  end

  test "should update student_residence_town" do
    patch student_residence_town_url(@student_residence_town), params: { student_residence_town: {  } }
    assert_redirected_to student_residence_town_url(@student_residence_town)
  end

  test "should destroy student_residence_town" do
    assert_difference('StudentResidenceTown.count', -1) do
      delete student_residence_town_url(@student_residence_town)
    end

    assert_redirected_to student_residence_towns_url
  end
end
