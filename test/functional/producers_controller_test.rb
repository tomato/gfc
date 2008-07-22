require File.dirname(__FILE__) + '/../test_helper'

class ProducersControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:producers)
  end

  def test_show
    p = Producer.find(:first)
    get :show, :id => p.id
    assert_response :success
    assert_equal assigns(:producer), p
  end

  def test_edit
    p = Producer.find(:first)
    get :edit, :id => p.id
    assert_response :success
  end
  
  #def test_update
  #  p = Producer.find(:first)
  #  post :update
  #end

end
