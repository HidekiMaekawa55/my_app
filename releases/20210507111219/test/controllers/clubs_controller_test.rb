require 'test_helper'

class ClubsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @club = clubs(:one)
  end
  
  test "should get index" do
    get clubs_path
    assert_response :success
  end

end
