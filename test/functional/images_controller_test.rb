require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "getting a win image" do
    get :show, :kind => 'win', :format => 'txt'
    assert IMAGES['win'].include?(@response.body) 
  end

  test "getting a fail image" do
    get :show, :kind => 'fail', :format => 'txt'
    assert IMAGES['fail'].include?(@response.body) 
  end

  test "getting an unrecognized image" do 
    get :show, :kind => 'other'
    assert_response(:bad_request)
  end
end
