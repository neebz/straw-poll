require 'test_helper'

class PollControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select ".constituency_class", 5
    assert_select ".party_class", 3
  end

  test "should get results" do
    get :results, format: :json
    assert_response :success
  end

  test "should post vote" do
    assert_difference "Vote.count" do
      post :vote, constituency_id: 1, party_id: 1, format: :json
    end
    hash = JSON.parse @response.body
    p hash
    assert_response :success
    assert_equal hash["constituency_id"], 1
    assert_equal hash["party_id"], 1

  end
  
  def setup
  	Fabricate :party, name: "Conservative"
  	Fabricate :party, name: "Labour"
  	Fabricate :party, name: "Liberal Democrats"
    
    Fabricate :constituency, name: "London"
  	Fabricate :constituency, name: "Aldershot"
  	Fabricate :constituency, name: "Brighton"
  	Fabricate :constituency, name: "Bristol"
  	Fabricate :constituency, name: "Leeds"
  end

end
