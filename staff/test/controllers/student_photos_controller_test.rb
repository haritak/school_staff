require 'test_helper'

class StudentPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_photo = student_photos(:one)
  end

  test "should get index" do
    get student_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_student_photo_url
    assert_response :success
  end

  test "should create student_photo" do
    assert_difference('StudentPhoto.count') do
      post student_photos_url, params: { student_photo: { filename: @student_photo.filename, student_id: @student_photo.student_id, type: @student_photo.type } }
    end

    assert_redirected_to student_photo_url(StudentPhoto.last)
  end

  test "should show student_photo" do
    get student_photo_url(@student_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_photo_url(@student_photo)
    assert_response :success
  end

  test "should update student_photo" do
    patch student_photo_url(@student_photo), params: { student_photo: { filename: @student_photo.filename, student_id: @student_photo.student_id, type: @student_photo.type } }
    assert_redirected_to student_photo_url(@student_photo)
  end

  test "should destroy student_photo" do
    assert_difference('StudentPhoto.count', -1) do
      delete student_photo_url(@student_photo)
    end

    assert_redirected_to student_photos_url
  end
end
