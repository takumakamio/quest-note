require 'test_helper'

class QuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get quests_new_url
    assert_response :success
  end

end
