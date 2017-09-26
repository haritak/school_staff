require 'test_helper'

class RequestSpecificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_specification = request_specifications(:one)
  end

  test "should get index" do
    get request_specifications_url
    assert_response :success
  end

  test "should get new" do
    get new_request_specification_url
    assert_response :success
  end

  test "should create request_specification" do
    assert_difference('RequestSpecification.count') do
      post request_specifications_url, params: { request_specification: { request_description: @request_specification.request_description, request_spec_reference: @request_specification.request_spec_reference, request_type: @request_specification.request_type, teacher_working_class_id: @request_specification.teacher_working_class_id, template_filename: @request_specification.template_filename } }
    end

    assert_redirected_to request_specification_url(RequestSpecification.last)
  end

  test "should show request_specification" do
    get request_specification_url(@request_specification)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_specification_url(@request_specification)
    assert_response :success
  end

  test "should update request_specification" do
    patch request_specification_url(@request_specification), params: { request_specification: { request_description: @request_specification.request_description, request_spec_reference: @request_specification.request_spec_reference, request_type: @request_specification.request_type, teacher_working_class_id: @request_specification.teacher_working_class_id, template_filename: @request_specification.template_filename } }
    assert_redirected_to request_specification_url(@request_specification)
  end

  test "should destroy request_specification" do
    assert_difference('RequestSpecification.count', -1) do
      delete request_specification_url(@request_specification)
    end

    assert_redirected_to request_specifications_url
  end
end
