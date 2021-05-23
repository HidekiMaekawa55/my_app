require 'test_helper'

class ManuscriptTest < ActiveSupport::TestCase
  
  def setup
    @manuscript = Manuscript.new(title: "title", content: "content")
  end
  
  test "title should be present" do
    @manuscript.title = " "
    assert_not @manuscript.valid?
  end
  
  test "content should be present" do
    @manuscript.content = " "
    assert_not @manuscript.valid?
  end
  
end
