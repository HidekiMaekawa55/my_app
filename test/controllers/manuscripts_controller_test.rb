require 'test_helper'

class ManuscriptsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @manuscript = manuscripts(:one)
  end
  
  test "should get index" do
    get manuscripts_path
    assert_response :success
  end

  test "should get show" do
    get manuscript_path(@manuscript)
    assert_response :success
  end

  test "should get new" do
    get new_manuscript_path
    assert_response :success
  end

  test "should get edit" do
    get edit_manuscript_path(@manuscript)
    assert_response :success
  end

end
