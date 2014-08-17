require 'test_helper'

class PatternsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in users(:root)
  end

  test "should get view" do
    get :view
    assert_response :success
  end
end
