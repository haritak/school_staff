require 'test_helper'

class StudentBusCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_bus_card = student_bus_cards(:one)
  end

  test "should get index" do
    get student_bus_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_student_bus_card_url
    assert_response :success
  end

  test "should create student_bus_card" do
    assert_difference('StudentBusCard.count') do
      post student_bus_cards_url, params: { student_bus_card: {  } }
    end

    assert_redirected_to student_bus_card_url(StudentBusCard.last)
  end

  test "should show student_bus_card" do
    get student_bus_card_url(@student_bus_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_bus_card_url(@student_bus_card)
    assert_response :success
  end

  test "should update student_bus_card" do
    patch student_bus_card_url(@student_bus_card), params: { student_bus_card: {  } }
    assert_redirected_to student_bus_card_url(@student_bus_card)
  end

  test "should destroy student_bus_card" do
    assert_difference('StudentBusCard.count', -1) do
      delete student_bus_card_url(@student_bus_card)
    end

    assert_redirected_to student_bus_cards_url
  end
end
