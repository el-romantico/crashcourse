require 'test_helper'

class PatternsControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

end
