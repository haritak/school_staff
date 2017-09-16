require 'test_helper'

class StudentResidenceAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_residence_address = student_residence_addresses(:one)
  end

  test "should get index" do
    get student_residence_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_student_residence_address_url
    assert_response :success
  end

  test "should create student_residence_address" do
    assert_difference('StudentResidenceAddress.count') do
      post student_residence_addresses_url, params: { student_residence_address: {  } }
    end

    assert_redirected_to student_residence_address_url(StudentResidenceAddress.last)
  end

  test "should show student_residence_address" do
    get student_residence_address_url(@student_residence_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_residence_address_url(@student_residence_address)
    assert_response :success
  end

  test "should update student_residence_address" do
    patch student_residence_address_url(@student_residence_address), params: { student_residence_address: {  } }
    assert_redirected_to student_residence_address_url(@student_residence_address)
  end

  test "should destroy student_residence_address" do
    assert_difference('StudentResidenceAddress.count', -1) do
      delete student_residence_address_url(@student_residence_address)
    end

    assert_redirected_to student_residence_addresses_url
  end
end
