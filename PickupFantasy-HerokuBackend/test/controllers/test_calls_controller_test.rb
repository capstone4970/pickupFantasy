require 'test_helper'

class TestCallsControllerTest < ActionController::TestCase
  setup do
    @test_call = test_calls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_calls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_call" do
    assert_difference('TestCall.count') do
      post :create, test_call: { meta: @test_call.meta, objects: @test_call.objects }
    end

    assert_redirected_to test_call_path(assigns(:test_call))
  end

  test "should show test_call" do
    get :show, id: @test_call
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_call
    assert_response :success
  end

  test "should update test_call" do
    patch :update, id: @test_call, test_call: { meta: @test_call.meta, objects: @test_call.objects }
    assert_redirected_to test_call_path(assigns(:test_call))
  end

  test "should destroy test_call" do
    assert_difference('TestCall.count', -1) do
      delete :destroy, id: @test_call
    end

    assert_redirected_to test_calls_path
  end
end
