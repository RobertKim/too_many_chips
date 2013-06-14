require 'test_helper'

class EventItemsControllerTest < ActionController::TestCase
  setup do
    @event_item = event_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_item" do
    assert_difference('EventItem.count') do
      post :create, event_item: {  }
    end

    assert_redirected_to event_item_path(assigns(:event_item))
  end

  test "should show event_item" do
    get :show, id: @event_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_item
    assert_response :success
  end

  test "should update event_item" do
    put :update, id: @event_item, event_item: {  }
    assert_redirected_to event_item_path(assigns(:event_item))
  end

  test "should destroy event_item" do
    assert_difference('EventItem.count', -1) do
      delete :destroy, id: @event_item
    end

    assert_redirected_to event_items_path
  end
end
