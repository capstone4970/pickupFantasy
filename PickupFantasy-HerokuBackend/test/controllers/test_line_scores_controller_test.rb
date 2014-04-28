require 'test_helper'

class TestLineScoresControllerTest < ActionController::TestCase
  setup do
    @test_line_score = test_line_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_line_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_line_score" do
    assert_difference('TestLineScore.count') do
      post :create, test_line_score: { extra: @test_line_score.extra, quarter: @test_line_score.quarter, running_score: @test_line_score.running_score, score: @test_line_score.score }
    end

    assert_redirected_to test_line_score_path(assigns(:test_line_score))
  end

  test "should show test_line_score" do
    get :show, id: @test_line_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_line_score
    assert_response :success
  end

  test "should update test_line_score" do
    patch :update, id: @test_line_score, test_line_score: { extra: @test_line_score.extra, quarter: @test_line_score.quarter, running_score: @test_line_score.running_score, score: @test_line_score.score }
    assert_redirected_to test_line_score_path(assigns(:test_line_score))
  end

  test "should destroy test_line_score" do
    assert_difference('TestLineScore.count', -1) do
      delete :destroy, id: @test_line_score
    end

    assert_redirected_to test_line_scores_path
  end
end
