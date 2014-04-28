require 'test_helper'

class TestActivesControllerTest < ActionController::TestCase
  setup do
    @test_active = test_actives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_actives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_active" do
    assert_difference('TestActive.count') do
      post :create, test_active: { active_state: @test_active.active_state, distance: @test_active.distance, down: @test_active.down, minutes: @test_active.minutes, quarter: @test_active.quarter, seconds: @test_active.seconds, segment_number: @test_active.segment_number, status: @test_active.status, status_id: @test_active.status_id, team_possession_id: @test_active.team_possession_id, under_review: @test_active.under_review, yards_from_goal: @test_active.yards_from_goal }
    end

    assert_redirected_to test_active_path(assigns(:test_active))
  end

  test "should show test_active" do
    get :show, id: @test_active
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_active
    assert_response :success
  end

  test "should update test_active" do
    patch :update, id: @test_active, test_active: { active_state: @test_active.active_state, distance: @test_active.distance, down: @test_active.down, minutes: @test_active.minutes, quarter: @test_active.quarter, seconds: @test_active.seconds, segment_number: @test_active.segment_number, status: @test_active.status, status_id: @test_active.status_id, team_possession_id: @test_active.team_possession_id, under_review: @test_active.under_review, yards_from_goal: @test_active.yards_from_goal }
    assert_redirected_to test_active_path(assigns(:test_active))
  end

  test "should destroy test_active" do
    assert_difference('TestActive.count', -1) do
      delete :destroy, id: @test_active
    end

    assert_redirected_to test_actives_path
  end
end
