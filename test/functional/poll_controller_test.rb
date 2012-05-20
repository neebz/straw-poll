require 'test_helper'

class PollControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select ".constituency_class", 5
    assert_select ".party_class", 3
  end

  test "should get all results" do
    get :results, format: :json
    assert_response :success
  end

  test "should post vote" do
    assert_difference "Vote.count" do
      post :vote, will_vote: true, constituency_id: 1, party_id: 1, will_vote: true, format: :json
    end
    hash = JSON.parse @response.body
    assert_response :success
    assert_equal 1, hash["vote"]["constituency_id"]
    assert_equal 1, hash["vote"]["party_id"]
    assert_equal true, hash["vote"]["will_vote"]

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
