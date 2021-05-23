require 'test_helper'

class CreditsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @credit = credits(:one)
  end
  
  test "should get index" do
    get credits_path
    assert_response :success
  end

  test "should get new" do
    get new_credit_path
    assert_response :success
  end

end
