require 'test_helper'

class DirectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get directors_show_url
    assert_response :success
  end

  test "should get index" do
    get directors_index_url
    assert_response :success
  end

  test "should get create" do
    get directors_create_url
    assert_response :success
  end

  test "should get new" do
    get directors_new_url
    assert_response :success
  end

end
