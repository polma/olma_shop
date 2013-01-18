require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test 'can add to the cart' do
    assert_difference('OrderItem.count') do
      post :add, {:id => 1}
    end
  end
  test 'returns cart contents' do
    post :add, {:id => 1}
    post :show, :format => :json
    assert_match(/Product1/, @response.body)
  end
  test 'can delete from the cart' do
    post :show, :format => :json
    assert_no_match(/Product2/, @response.body) 
    post :add, {:id => 2}
    post :show, :format => :json
    assert_match(/Product2/, @response.body) 
    post :del, {:id => 2}
    post :show, :format => :json
    assert_no_match(/Product2/, @response.body) 
  end
end
