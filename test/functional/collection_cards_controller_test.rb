require 'test_helper'

class CollectionCardsControllerTest < ActionController::TestCase
  setup do
    @collection_card = collection_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collection_card" do
    assert_difference('CollectionCard.count') do
      post :create, :collection_card => @collection_card.attributes
    end

    assert_redirected_to collection_card_path(assigns(:collection_card))
  end

  test "should show collection_card" do
    get :show, :id => @collection_card.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @collection_card.to_param
    assert_response :success
  end

  test "should update collection_card" do
    put :update, :id => @collection_card.to_param, :collection_card => @collection_card.attributes
    assert_redirected_to collection_card_path(assigns(:collection_card))
  end

  test "should destroy collection_card" do
    assert_difference('CollectionCard.count', -1) do
      delete :destroy, :id => @collection_card.to_param
    end

    assert_redirected_to collection_cards_path
  end
end
