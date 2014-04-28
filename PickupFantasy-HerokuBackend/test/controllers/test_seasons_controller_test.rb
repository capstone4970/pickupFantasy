require 'test_helper'

class TestSeasonsControllerTest < ActionController::TestCase
  setup do
    @test_season = test_seasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_seasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_season" do
    assert_difference('TestSeason.count') do
      post :create, test_season: { active: @test_season.active, created: @test_season.created, end_date: @test_season.end_date, name: @test_season.name, resource_uri: @test_season.resource_uri, season_id: @test_season.season_id, slug: @test_season.slug, start_date: @test_season.start_date, updated: @test_season.updated, year: @test_season.year }
    end

    assert_redirected_to test_season_path(assigns(:test_season))
  end

  test "should show test_season" do
    get :show, id: @test_season
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_season
    assert_response :success
  end

  test "should update test_season" do
    patch :update, id: @test_season, test_season: { active: @test_season.active, created: @test_season.created, end_date: @test_season.end_date, name: @test_season.name, resource_uri: @test_season.resource_uri, season_id: @test_season.season_id, slug: @test_season.slug, start_date: @test_season.start_date, updated: @test_season.updated, year: @test_season.year }
    assert_redirected_to test_season_path(assigns(:test_season))
  end

  test "should destroy test_season" do
    assert_difference('TestSeason.count', -1) do
      delete :destroy, id: @test_season
    end

    assert_redirected_to test_seasons_path
  end
end
