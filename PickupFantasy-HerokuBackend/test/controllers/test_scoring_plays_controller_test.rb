require 'test_helper'

class TestScoringPlaysControllerTest < ActionController::TestCase
  setup do
    @test_scoring_play = test_scoring_plays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_scoring_plays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_scoring_play" do
    assert_difference('TestScoringPlay.count') do
      post :create, test_scoring_play: { _game_cache: @test_scoring_play._game_cache, _state: @test_scoring_play._state, active: @test_scoring_play.active, assist1: @test_scoring_play.assist1, assist1_global_id: @test_scoring_play.assist1_global_id, assist1_id: @test_scoring_play.assist1_id, assist2: @test_scoring_play.assist2, assist2_global_id: @test_scoring_play.assist2_global_id, assist2_id: @test_scoring_play.assist2_id, away_score_after: @test_scoring_play.away_score_after, away_score_before: @test_scoring_play.away_score_before, continuation: @test_scoring_play.continuation, created: @test_scoring_play.created, details: @test_scoring_play.details, direction: @test_scoring_play.direction, distance: @test_scoring_play.distance, down: @test_scoring_play.down, drive_id: @test_scoring_play.drive_id, end_possession: @test_scoring_play.end_possession, end_yardline: @test_scoring_play.end_yardline, game_id: @test_scoring_play.game_id, game_time: @test_scoring_play.game_time, game_time_minute: @test_scoring_play.game_time_minute, game_time_second: @test_scoring_play.game_time_second, home_score_after: @test_scoring_play.home_score_after, home_score_before: @test_scoring_play.home_score_before, pass_defensed1: @test_scoring_play.pass_defensed1, pass_defensed1_id: @test_scoring_play.pass_defensed1_id, pat_type: @test_scoring_play.pat_type, pat_value: @test_scoring_play.pat_value, play_type: @test_scoring_play.play_type, play_type_id: @test_scoring_play.play_type_id, player1_global_id: @test_scoring_play.player1_global_id, player1_id: @test_scoring_play.player1_id, player2_global_id: @test_scoring_play.player2_global_id, player2_id: @test_scoring_play.player2_id, player3_global_id: @test_scoring_play.player3_global_id, player3_id: @test_scoring_play.player3_id, possession: @test_scoring_play.possession, quarter: @test_scoring_play.quarter, review_team: @test_scoring_play.review_team, review_team_global_id: @test_scoring_play.review_team_global_id, review_team_id: @test_scoring_play.review_team_id, score_description: @test_scoring_play.score_description, score_type: @test_scoring_play.score_type, scoring_play: @test_scoring_play.scoring_play, scoring_play_id: @test_scoring_play.scoring_play_id, slug: @test_scoring_play.slug, stats_id: @test_scoring_play.stats_id, tackle1: @test_scoring_play.tackle1, tackle1_global_id: @test_scoring_play.tackle1_global_id, tackle1_id: @test_scoring_play.tackle1_id, tackle2: @test_scoring_play.tackle2, tackle2_global_id: @test_scoring_play.tackle2_global_id, tackle2_id: @test_scoring_play.tackle2_id, target: @test_scoring_play.target, target_id: @test_scoring_play.target_id, time: @test_scoring_play.time, true_away_score_after: @test_scoring_play.true_away_score_after, true_details: @test_scoring_play.true_details, true_home_score_after: @test_scoring_play.true_home_score_after, updated: @test_scoring_play.updated, yardline: @test_scoring_play.yardline, yards: @test_scoring_play.yards }
    end

    assert_redirected_to test_scoring_play_path(assigns(:test_scoring_play))
  end

  test "should show test_scoring_play" do
    get :show, id: @test_scoring_play
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_scoring_play
    assert_response :success
  end

  test "should update test_scoring_play" do
    patch :update, id: @test_scoring_play, test_scoring_play: { _game_cache: @test_scoring_play._game_cache, _state: @test_scoring_play._state, active: @test_scoring_play.active, assist1: @test_scoring_play.assist1, assist1_global_id: @test_scoring_play.assist1_global_id, assist1_id: @test_scoring_play.assist1_id, assist2: @test_scoring_play.assist2, assist2_global_id: @test_scoring_play.assist2_global_id, assist2_id: @test_scoring_play.assist2_id, away_score_after: @test_scoring_play.away_score_after, away_score_before: @test_scoring_play.away_score_before, continuation: @test_scoring_play.continuation, created: @test_scoring_play.created, details: @test_scoring_play.details, direction: @test_scoring_play.direction, distance: @test_scoring_play.distance, down: @test_scoring_play.down, drive_id: @test_scoring_play.drive_id, end_possession: @test_scoring_play.end_possession, end_yardline: @test_scoring_play.end_yardline, game_id: @test_scoring_play.game_id, game_time: @test_scoring_play.game_time, game_time_minute: @test_scoring_play.game_time_minute, game_time_second: @test_scoring_play.game_time_second, home_score_after: @test_scoring_play.home_score_after, home_score_before: @test_scoring_play.home_score_before, pass_defensed1: @test_scoring_play.pass_defensed1, pass_defensed1_id: @test_scoring_play.pass_defensed1_id, pat_type: @test_scoring_play.pat_type, pat_value: @test_scoring_play.pat_value, play_type: @test_scoring_play.play_type, play_type_id: @test_scoring_play.play_type_id, player1_global_id: @test_scoring_play.player1_global_id, player1_id: @test_scoring_play.player1_id, player2_global_id: @test_scoring_play.player2_global_id, player2_id: @test_scoring_play.player2_id, player3_global_id: @test_scoring_play.player3_global_id, player3_id: @test_scoring_play.player3_id, possession: @test_scoring_play.possession, quarter: @test_scoring_play.quarter, review_team: @test_scoring_play.review_team, review_team_global_id: @test_scoring_play.review_team_global_id, review_team_id: @test_scoring_play.review_team_id, score_description: @test_scoring_play.score_description, score_type: @test_scoring_play.score_type, scoring_play: @test_scoring_play.scoring_play, scoring_play_id: @test_scoring_play.scoring_play_id, slug: @test_scoring_play.slug, stats_id: @test_scoring_play.stats_id, tackle1: @test_scoring_play.tackle1, tackle1_global_id: @test_scoring_play.tackle1_global_id, tackle1_id: @test_scoring_play.tackle1_id, tackle2: @test_scoring_play.tackle2, tackle2_global_id: @test_scoring_play.tackle2_global_id, tackle2_id: @test_scoring_play.tackle2_id, target: @test_scoring_play.target, target_id: @test_scoring_play.target_id, time: @test_scoring_play.time, true_away_score_after: @test_scoring_play.true_away_score_after, true_details: @test_scoring_play.true_details, true_home_score_after: @test_scoring_play.true_home_score_after, updated: @test_scoring_play.updated, yardline: @test_scoring_play.yardline, yards: @test_scoring_play.yards }
    assert_redirected_to test_scoring_play_path(assigns(:test_scoring_play))
  end

  test "should destroy test_scoring_play" do
    assert_difference('TestScoringPlay.count', -1) do
      delete :destroy, id: @test_scoring_play
    end

    assert_redirected_to test_scoring_plays_path
  end
end
