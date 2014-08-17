require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @course = courses(:one)
    @request.env["devise.mapping"] = Devise.mappings[:admin]

    sign_in users(:root)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { location: 'My space',
                              name: 'My course',
                              tags: 'special,course' }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do

      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
