require 'test_helper'

class ResponseSpecificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @response_specification = response_specifications(:one)
  end

  test "should get index" do
    get response_specifications_url
    assert_response :success
  end

  test "should get new" do
    get new_response_specification_url
    assert_response :success
  end

  test "should create response_specification" do
    assert_difference('ResponseSpecification.count') do
      post response_specifications_url, params: { response_specification: { request_specification_id: @response_specification.request_specification_id, template_filename: @response_specification.template_filename } }
    end

    assert_redirected_to response_specification_url(ResponseSpecification.last)
  end

  test "should show response_specification" do
    get response_specification_url(@response_specification)
    assert_response :success
  end

  test "should get edit" do
    get edit_response_specification_url(@response_specification)
    assert_response :success
  end

  test "should update response_specification" do
    patch response_specification_url(@response_specification), params: { response_specification: { request_specification_id: @response_specification.request_specification_id, template_filename: @response_specification.template_filename } }
    assert_redirected_to response_specification_url(@response_specification)
  end

  test "should destroy response_specification" do
    assert_difference('ResponseSpecification.count', -1) do
      delete response_specification_url(@response_specification)
    end

    assert_redirected_to response_specifications_url
  end
end
