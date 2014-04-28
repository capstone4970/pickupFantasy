require 'test_helper'

class TestMetaControllerTest < ActionController::TestCase
  setup do
    @test_metum = test_meta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_meta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_metum" do
    assert_difference('TestMetum.count') do
      post :create, test_metum: { limit: @test_metum.limit, next: @test_metum.next, offset: @test_metum.offset, previous: @test_metum.previous, total_count: @test_metum.total_count }
    end

    assert_redirected_to test_metum_path(assigns(:test_metum))
  end

  test "should show test_metum" do
    get :show, id: @test_metum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_metum
    assert_response :success
  end

  test "should update test_metum" do
    patch :update, id: @test_metum, test_metum: { limit: @test_metum.limit, next: @test_metum.next, offset: @test_metum.offset, previous: @test_metum.previous, total_count: @test_metum.total_count }
    assert_redirected_to test_metum_path(assigns(:test_metum))
  end

  test "should destroy test_metum" do
    assert_difference('TestMetum.count', -1) do
      delete :destroy, id: @test_metum
    end

    assert_redirected_to test_meta_path
  end
end
