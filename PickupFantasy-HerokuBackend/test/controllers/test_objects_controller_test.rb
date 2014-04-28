require 'test_helper'

class TestObjectsControllerTest < ActionController::TestCase
  setup do
    @test_object = test_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_object" do
    assert_difference('TestObject.count') do
      post :create, test_object: { active: @test_object.active, away_team: @test_object.away_team, away_team_stats: @test_object.away_team_stats, away_total_score: @test_object.away_total_score, created: @test_object.created, final: @test_object.final, finalbox: @test_object.finalbox, game_code: @test_object.game_code, game_date_day: @test_object.game_date_day, game_date_epoch_time: @test_object.game_date_epoch_time, game_date_month: @test_object.game_date_month, game_date_time: @test_object.game_date_time, game_date_year: @test_object.game_date_year, game_location: @test_object.game_location, game_progress: @test_object.game_progress, game_quarter_time: @test_object.game_quarter_time, game_status: @test_object.game_status, game_status_id: @test_object.game_status_id, game_type: @test_object.game_type, game_type_id: @test_object.game_type_id, global_id: @test_object.global_id, home_team: @test_object.home_team, home_team_stats: @test_object.home_team_stats, home_total_score: @test_object.home_total_score, latest_play: @test_object.latest_play, latest_plays: @test_object.latest_plays, line_score: @test_object.line_score, objects_id: @test_object.objects_id, players: @test_object.players, possession: @test_object.possession, resource_uri: @test_object.resource_uri, scoring_plays: @test_object.scoring_plays, season: @test_object.season, slug: @test_object.slug, status: @test_object.status, summary: @test_object.summary, teams: @test_object.teams, tv_station: @test_object.tv_station, updated: @test_object.updated, updated_epoch_time: @test_object.updated_epoch_time, week: @test_object.week }
    end

    assert_redirected_to test_object_path(assigns(:test_object))
  end

  test "should show test_object" do
    get :show, id: @test_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_object
    assert_response :success
  end

  test "should update test_object" do
    patch :update, id: @test_object, test_object: { active: @test_object.active, away_team: @test_object.away_team, away_team_stats: @test_object.away_team_stats, away_total_score: @test_object.away_total_score, created: @test_object.created, final: @test_object.final, finalbox: @test_object.finalbox, game_code: @test_object.game_code, game_date_day: @test_object.game_date_day, game_date_epoch_time: @test_object.game_date_epoch_time, game_date_month: @test_object.game_date_month, game_date_time: @test_object.game_date_time, game_date_year: @test_object.game_date_year, game_location: @test_object.game_location, game_progress: @test_object.game_progress, game_quarter_time: @test_object.game_quarter_time, game_status: @test_object.game_status, game_status_id: @test_object.game_status_id, game_type: @test_object.game_type, game_type_id: @test_object.game_type_id, global_id: @test_object.global_id, home_team: @test_object.home_team, home_team_stats: @test_object.home_team_stats, home_total_score: @test_object.home_total_score, latest_play: @test_object.latest_play, latest_plays: @test_object.latest_plays, line_score: @test_object.line_score, objects_id: @test_object.objects_id, players: @test_object.players, possession: @test_object.possession, resource_uri: @test_object.resource_uri, scoring_plays: @test_object.scoring_plays, season: @test_object.season, slug: @test_object.slug, status: @test_object.status, summary: @test_object.summary, teams: @test_object.teams, tv_station: @test_object.tv_station, updated: @test_object.updated, updated_epoch_time: @test_object.updated_epoch_time, week: @test_object.week }
    assert_redirected_to test_object_path(assigns(:test_object))
  end

  test "should destroy test_object" do
    assert_difference('TestObject.count', -1) do
      delete :destroy, id: @test_object
    end

    assert_redirected_to test_objects_path
  end
end
