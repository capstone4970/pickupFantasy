require 'test_helper'

class TestPlaysControllerTest < ActionController::TestCase
  setup do
    @test_play = test_plays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_plays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_play" do
    assert_difference('TestPlay.count') do
      post :create, test_play: { active: @test_play.active, assist1: @test_play.assist1, assist1_global_id: @test_play.assist1_global_id, assist1_id: @test_play.assist1_id, assist2: @test_play.assist2, assist2_global_id: @test_play.assist2_global_id, assist_id: @test_play.assist_id, away_score_after: @test_play.away_score_after, away_score_before: @test_play.away_score_before, continuation: @test_play.continuation, details: @test_play.details, direction: @test_play.direction, distance: @test_play.distance, down: @test_play.down, drive_id: @test_play.drive_id, end_possession: @test_play.end_possession, end_yardline: @test_play.end_yardline, game: @test_play.game, game_time: @test_play.game_time, game_time_minute: @test_play.game_time_minute, game_time_second: @test_play.game_time_second, home_score_after: @test_play.home_score_after, home_score_before: @test_play.home_score_before, pass_defensed1: @test_play.pass_defensed1, pass_defensed1_id: @test_play.pass_defensed1_id, pat_type: @test_play.pat_type, pat_value: @test_play.pat_value, play_id: @test_play.play_id, play_type: @test_play.play_type, play_type_id: @test_play.play_type_id, player1_global_id: @test_play.player1_global_id, player1_id: @test_play.player1_id, player2_global_id: @test_play.player2_global_id, player2_id: @test_play.player2_id, player3_global_id: @test_play.player3_global_id, player3_id: @test_play.player3_id, possession: @test_play.possession, quarter: @test_play.quarter, resource_uri: @test_play.resource_uri, review_team: @test_play.review_team, review_team_global_id: @test_play.review_team_global_id, review_team_id: @test_play.review_team_id, score_description: @test_play.score_description, score_type: @test_play.score_type, scoring_play: @test_play.scoring_play, slug: @test_play.slug, stats_id: @test_play.stats_id, tackle1: @test_play.tackle1, tackle1_global_id: @test_play.tackle1_global_id, tackle1_id: @test_play.tackle1_id, tackle2: @test_play.tackle2, tackle2_global_id: @test_play.tackle2_global_id, tackle2_id: @test_play.tackle2_id, target: @test_play.target, target_id: @test_play.target_id, time: @test_play.time, true_time: @test_play.true_time, yardline: @test_play.yardline, yards: @test_play.yards }
    end

    assert_redirected_to test_play_path(assigns(:test_play))
  end

  test "should show test_play" do
    get :show, id: @test_play
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_play
    assert_response :success
  end

  test "should update test_play" do
    patch :update, id: @test_play, test_play: { active: @test_play.active, assist1: @test_play.assist1, assist1_global_id: @test_play.assist1_global_id, assist1_id: @test_play.assist1_id, assist2: @test_play.assist2, assist2_global_id: @test_play.assist2_global_id, assist_id: @test_play.assist_id, away_score_after: @test_play.away_score_after, away_score_before: @test_play.away_score_before, continuation: @test_play.continuation, details: @test_play.details, direction: @test_play.direction, distance: @test_play.distance, down: @test_play.down, drive_id: @test_play.drive_id, end_possession: @test_play.end_possession, end_yardline: @test_play.end_yardline, game: @test_play.game, game_time: @test_play.game_time, game_time_minute: @test_play.game_time_minute, game_time_second: @test_play.game_time_second, home_score_after: @test_play.home_score_after, home_score_before: @test_play.home_score_before, pass_defensed1: @test_play.pass_defensed1, pass_defensed1_id: @test_play.pass_defensed1_id, pat_type: @test_play.pat_type, pat_value: @test_play.pat_value, play_id: @test_play.play_id, play_type: @test_play.play_type, play_type_id: @test_play.play_type_id, player1_global_id: @test_play.player1_global_id, player1_id: @test_play.player1_id, player2_global_id: @test_play.player2_global_id, player2_id: @test_play.player2_id, player3_global_id: @test_play.player3_global_id, player3_id: @test_play.player3_id, possession: @test_play.possession, quarter: @test_play.quarter, resource_uri: @test_play.resource_uri, review_team: @test_play.review_team, review_team_global_id: @test_play.review_team_global_id, review_team_id: @test_play.review_team_id, score_description: @test_play.score_description, score_type: @test_play.score_type, scoring_play: @test_play.scoring_play, slug: @test_play.slug, stats_id: @test_play.stats_id, tackle1: @test_play.tackle1, tackle1_global_id: @test_play.tackle1_global_id, tackle1_id: @test_play.tackle1_id, tackle2: @test_play.tackle2, tackle2_global_id: @test_play.tackle2_global_id, tackle2_id: @test_play.tackle2_id, target: @test_play.target, target_id: @test_play.target_id, time: @test_play.time, true_time: @test_play.true_time, yardline: @test_play.yardline, yards: @test_play.yards }
    assert_redirected_to test_play_path(assigns(:test_play))
  end

  test "should destroy test_play" do
    assert_difference('TestPlay.count', -1) do
      delete :destroy, id: @test_play
    end

    assert_redirected_to test_plays_path
  end
end
