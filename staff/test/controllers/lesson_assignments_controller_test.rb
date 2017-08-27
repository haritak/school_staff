require 'test_helper'

class LessonAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_assignment = lesson_assignments(:one)
  end

  test "should get index" do
    get lesson_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_assignment_url
    assert_response :success
  end

  test "should create lesson_assignment" do
    assert_difference('LessonAssignment.count') do
      post lesson_assignments_url, params: { lesson_assignment: { lesson_id: @lesson_assignment.lesson_id, priority: @lesson_assignment.priority, reference: @lesson_assignment.reference, specialty_id: @lesson_assignment.specialty_id } }
    end

    assert_redirected_to lesson_assignment_url(LessonAssignment.last)
  end

  test "should show lesson_assignment" do
    get lesson_assignment_url(@lesson_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_assignment_url(@lesson_assignment)
    assert_response :success
  end

  test "should update lesson_assignment" do
    patch lesson_assignment_url(@lesson_assignment), params: { lesson_assignment: { lesson_id: @lesson_assignment.lesson_id, priority: @lesson_assignment.priority, reference: @lesson_assignment.reference, specialty_id: @lesson_assignment.specialty_id } }
    assert_redirected_to lesson_assignment_url(@lesson_assignment)
  end

  test "should destroy lesson_assignment" do
    assert_difference('LessonAssignment.count', -1) do
      delete lesson_assignment_url(@lesson_assignment)
    end

    assert_redirected_to lesson_assignments_url
  end
end
