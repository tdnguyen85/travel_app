require 'test_helper'

class ItenerariesControllerTest < ActionController::TestCase
  setup do
    @itenerary = iteneraries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iteneraries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itenerary" do
    assert_difference('Itenerary.count') do
      post :create, itenerary: { activity_to_do: @itenerary.activity_to_do, item: @itenerary.item, place_to_eat: @itenerary.place_to_eat, place_to_sleep: @itenerary.place_to_sleep }
    end

    assert_redirected_to itenerary_path(assigns(:itenerary))
  end

  test "should show itenerary" do
    get :show, id: @itenerary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itenerary
    assert_response :success
  end

  test "should update itenerary" do
    put :update, id: @itenerary, itenerary: { activity_to_do: @itenerary.activity_to_do, item: @itenerary.item, place_to_eat: @itenerary.place_to_eat, place_to_sleep: @itenerary.place_to_sleep }
    assert_redirected_to itenerary_path(assigns(:itenerary))
  end

  test "should destroy itenerary" do
    assert_difference('Itenerary.count', -1) do
      delete :destroy, id: @itenerary
    end

    assert_redirected_to iteneraries_path
  end
end
