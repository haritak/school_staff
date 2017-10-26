require 'test_helper'

class RequestSupportDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_support_document = request_support_documents(:one)
  end

  test "should get index" do
    get request_support_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_request_support_document_url
    assert_response :success
  end

  test "should create request_support_document" do
    assert_difference('RequestSupportDocument.count') do
      post request_support_documents_url, params: { request_support_document: { description: @request_support_document.description, issuer: @request_support_document.issuer, issuer_date: @request_support_document.issuer_date, issuer_protocol: @request_support_document.issuer_protocol, order: @request_support_document.order, school_teacher_request_id: @request_support_document.school_teacher_request_id } }
    end

    assert_redirected_to request_support_document_url(RequestSupportDocument.last)
  end

  test "should show request_support_document" do
    get request_support_document_url(@request_support_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_support_document_url(@request_support_document)
    assert_response :success
  end

  test "should update request_support_document" do
    patch request_support_document_url(@request_support_document), params: { request_support_document: { description: @request_support_document.description, issuer: @request_support_document.issuer, issuer_date: @request_support_document.issuer_date, issuer_protocol: @request_support_document.issuer_protocol, order: @request_support_document.order, school_teacher_request_id: @request_support_document.school_teacher_request_id } }
    assert_redirected_to request_support_document_url(@request_support_document)
  end

  test "should destroy request_support_document" do
    assert_difference('RequestSupportDocument.count', -1) do
      delete request_support_document_url(@request_support_document)
    end

    assert_redirected_to request_support_documents_url
  end
end
