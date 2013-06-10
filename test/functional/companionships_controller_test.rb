require 'test_helper'

class CompanionshipsControllerTest < ActionController::TestCase
  setup do
    @companionship = companionships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companionships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create companionship" do
    assert_difference('Companionship.count') do
      post :create, companionship: { companion_id: @companionship.companion_id, user_id: @companionship.user_id }
    end

    assert_redirected_to companionship_path(assigns(:companionship))
  end

  test "should show companionship" do
    get :show, id: @companionship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @companionship
    assert_response :success
  end

  test "should update companionship" do
    put :update, id: @companionship, companionship: { companion_id: @companionship.companion_id, user_id: @companionship.user_id }
    assert_redirected_to companionship_path(assigns(:companionship))
  end

  test "should destroy companionship" do
    assert_difference('Companionship.count', -1) do
      delete :destroy, id: @companionship
    end

    assert_redirected_to companionships_path
  end
end
