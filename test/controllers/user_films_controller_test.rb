require 'test_helper'

class UserFilmsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_films_new_url
    assert_response :success
  end

  test "should get create" do
    get user_films_create_url
    assert_response :success
  end

end
