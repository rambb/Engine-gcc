require 'test_helper'

class DeckItemsControllerTest < ActionController::TestCase
  setup do
    @deck_item = deck_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deck_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deck_item" do
    assert_difference('DeckItem.count') do
      post :create, :deck_item => @deck_item.attributes
    end

    assert_redirected_to deck_item_path(assigns(:deck_item))
  end

  test "should show deck_item" do
    get :show, :id => @deck_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deck_item.to_param
    assert_response :success
  end

  test "should update deck_item" do
    put :update, :id => @deck_item.to_param, :deck_item => @deck_item.attributes
    assert_redirected_to deck_item_path(assigns(:deck_item))
  end

  test "should destroy deck_item" do
    assert_difference('DeckItem.count', -1) do
      delete :destroy, :id => @deck_item.to_param
    end

    assert_redirected_to deck_items_path
  end
end
