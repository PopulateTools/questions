require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def test_create
    get sessions_create_url
    assert_response :success
  end

end
