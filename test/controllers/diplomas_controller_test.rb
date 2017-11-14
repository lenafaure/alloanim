require 'test_helper'

class DiplomasControllerTest < ActionDispatch::IntegrationTest
=begin
  setup do
    @diploma = diplomas(:one)
  end

  test "should get index" do
    get diplomas_url
    assert_response :success
  end

  test "should get new" do
    get new_diploma_url
    assert_response :success
  end

  test "should create diploma" do
    assert_difference('Diploma.count') do
      post diplomas_url, params: { diploma: { name: @diploma.name } }
    end

    assert_redirected_to diploma_url(Diploma.last)
  end

  test "should show diploma" do
    get diploma_url(@diploma)
    assert_response :success
  end

  test "should get edit" do
    get edit_diploma_url(@diploma)
    assert_response :success
  end

  test "should update diploma" do
    patch diploma_url(@diploma), params: { diploma: { name: @diploma.name } }
    assert_redirected_to diploma_url(@diploma)
  end

  test "should destroy diploma" do
    assert_difference('Diploma.count', -1) do
      delete diploma_url(@diploma)
    end

    assert_redirected_to diplomas_url
  end
=end
end
