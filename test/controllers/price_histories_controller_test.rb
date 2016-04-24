require 'test_helper'

class PriceHistoriesControllerTest < ActionController::TestCase
  setup do
    @price_history = price_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:price_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price_history" do
    assert_difference('PriceHistory.count') do
      post :create, price_history: { price: @price_history.price, product_id: @price_history.product_id }
    end

    assert_redirected_to price_history_path(assigns(:price_history))
  end

  test "should show price_history" do
    get :show, id: @price_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @price_history
    assert_response :success
  end

  test "should update price_history" do
    patch :update, id: @price_history, price_history: { price: @price_history.price, product_id: @price_history.product_id }
    assert_redirected_to price_history_path(assigns(:price_history))
  end

  test "should destroy price_history" do
    assert_difference('PriceHistory.count', -1) do
      delete :destroy, id: @price_history
    end

    assert_redirected_to price_histories_path
  end
end
