require "test_helper"

class DecksControllerTest < ActionDispatch::IntegrationTest
  def test_show
    get decks_show_url
    assert_response :success
  end

end
