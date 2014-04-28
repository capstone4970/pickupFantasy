require 'test_helper'

class TestTeamsControllerTest < ActionController::TestCase
  setup do
    @test_team = test_teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_team" do
    assert_difference('TestTeam.count') do
      post :create, test_team: { active: @test_team.active, alias: @test_team.alias, city: @test_team.city, conference: @test_team.conference, conference_id: @test_team.conference_id, created: @test_team.created, division: @test_team.division, division_id: @test_team.division_id, global_id: @test_team.global_id, local_team: @test_team.local_team, logo_120x120: @test_team.logo_120x120, logo_30x30: @test_team.logo_30x30, logo_40x40: @test_team.logo_40x40, logo_60x60: @test_team.logo_60x60, name: @test_team.name, primary_color: @test_team.primary_color, record: @test_team.record, resource_uri: @test_team.resource_uri, secondary_color: @test_team.secondary_color, slug: @test_team.slug, stats_id: @test_team.stats_id, team_id: @test_team.team_id, total_defensive_rank: @test_team.total_defensive_rank, total_offensive_rank: @test_team.total_offensive_rank, total_passing_defense_rank: @test_team.total_passing_defense_rank, total_passing_offense_rank: @test_team.total_passing_offense_rank, total_rushing_defense_rank: @test_team.total_rushing_defense_rank, total_rushing_offense_rank: @test_team.total_rushing_offense_rank, updated: @test_team.updated }
    end

    assert_redirected_to test_team_path(assigns(:test_team))
  end

  test "should show test_team" do
    get :show, id: @test_team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_team
    assert_response :success
  end

  test "should update test_team" do
    patch :update, id: @test_team, test_team: { active: @test_team.active, alias: @test_team.alias, city: @test_team.city, conference: @test_team.conference, conference_id: @test_team.conference_id, created: @test_team.created, division: @test_team.division, division_id: @test_team.division_id, global_id: @test_team.global_id, local_team: @test_team.local_team, logo_120x120: @test_team.logo_120x120, logo_30x30: @test_team.logo_30x30, logo_40x40: @test_team.logo_40x40, logo_60x60: @test_team.logo_60x60, name: @test_team.name, primary_color: @test_team.primary_color, record: @test_team.record, resource_uri: @test_team.resource_uri, secondary_color: @test_team.secondary_color, slug: @test_team.slug, stats_id: @test_team.stats_id, team_id: @test_team.team_id, total_defensive_rank: @test_team.total_defensive_rank, total_offensive_rank: @test_team.total_offensive_rank, total_passing_defense_rank: @test_team.total_passing_defense_rank, total_passing_offense_rank: @test_team.total_passing_offense_rank, total_rushing_defense_rank: @test_team.total_rushing_defense_rank, total_rushing_offense_rank: @test_team.total_rushing_offense_rank, updated: @test_team.updated }
    assert_redirected_to test_team_path(assigns(:test_team))
  end

  test "should destroy test_team" do
    assert_difference('TestTeam.count', -1) do
      delete :destroy, id: @test_team
    end

    assert_redirected_to test_teams_path
  end
end
