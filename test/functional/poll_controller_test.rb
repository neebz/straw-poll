require 'test_helper'

class PollControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select ".constituency_class", 5
    assert_select ".party_class", 3
  end

  test "should post vote with will_vote as true" do
    assert_difference "Vote.count" do
      post :vote, will_vote: true, constituency_id: 1, party_id: 1, format: :json
    end
    hash = JSON.parse @response.body
    assert_response :success
    
    assert_equal 1, hash["results"]["national"]["yes"]
    assert_equal 0, hash["results"]["national"]["no"]
    assert_equal 1, hash["results"]["constituency"]["yes"]
    assert_equal 0, hash["results"]["constituency"]["no"]
    assert_equal 1, hash["constituency"]["id"]

  end

  test "should post vote with will_vote as false" do
    assert_difference "Vote.count" do
      post :vote, will_vote: false, constituency_id: 1, format: :json
    end
    hash = JSON.parse @response.body
    assert_response :success

    assert_equal 0, hash["results"]["national"]["yes"]
    assert_equal 1, hash["results"]["national"]["no"]
    assert_equal 0, hash["results"]["constituency"]["yes"]
    assert_equal 1, hash["results"]["constituency"]["no"]
    assert_equal 1, hash["constituency"]["id"]

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
