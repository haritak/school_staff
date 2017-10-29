require 'test_helper'

class DecisionFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @decision_file = decision_files(:one)
  end

  test "should get index" do
    get decision_files_url
    assert_response :success
  end

  test "should get new" do
    get new_decision_file_url
    assert_response :success
  end

  test "should create decision_file" do
    assert_difference('DecisionFile.count') do
      post decision_files_url, params: { decision_file: { filename: @decision_file.filename, school_teacher_response_id: @decision_file.school_teacher_response_id, target: @decision_file.target } }
    end

    assert_redirected_to decision_file_url(DecisionFile.last)
  end

  test "should show decision_file" do
    get decision_file_url(@decision_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_decision_file_url(@decision_file)
    assert_response :success
  end

  test "should update decision_file" do
    patch decision_file_url(@decision_file), params: { decision_file: { filename: @decision_file.filename, school_teacher_response_id: @decision_file.school_teacher_response_id, target: @decision_file.target } }
    assert_redirected_to decision_file_url(@decision_file)
  end

  test "should destroy decision_file" do
    assert_difference('DecisionFile.count', -1) do
      delete decision_file_url(@decision_file)
    end

    assert_redirected_to decision_files_url
  end
end
