require 'test_helper'

class TestStatusesControllerTest < ActionController::TestCase
  setup do
    @test_status = test_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_status" do
    assert_difference('TestStatus.count') do
      post :create, test_status: { active_state: @test_status.active_state, distance: @test_status.distance, down: @test_status.down, minutes: @test_status.minutes, quarter: @test_status.quarter, seconds: @test_status.seconds, segment_number: @test_status.segment_number, status: @test_status.status, status_id: @test_status.status_id, team_possession_id: @test_status.team_possession_id, under_review: @test_status.under_review, yards_from_goal: @test_status.yards_from_goal }
    end

    assert_redirected_to test_status_path(assigns(:test_status))
  end

  test "should show test_status" do
    get :show, id: @test_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_status
    assert_response :success
  end

  test "should update test_status" do
    patch :update, id: @test_status, test_status: { active_state: @test_status.active_state, distance: @test_status.distance, down: @test_status.down, minutes: @test_status.minutes, quarter: @test_status.quarter, seconds: @test_status.seconds, segment_number: @test_status.segment_number, status: @test_status.status, status_id: @test_status.status_id, team_possession_id: @test_status.team_possession_id, under_review: @test_status.under_review, yards_from_goal: @test_status.yards_from_goal }
    assert_redirected_to test_status_path(assigns(:test_status))
  end

  test "should destroy test_status" do
    assert_difference('TestStatus.count', -1) do
      delete :destroy, id: @test_status
    end

    assert_redirected_to test_statuses_path
  end
end
