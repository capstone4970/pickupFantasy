require 'test_helper'

class GamesOfWeeksControllerTest < ActionController::TestCase
  setup do
    @games_of_week = games_of_weeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games_of_weeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create games_of_week" do
    assert_difference('GamesOfWeek.count') do
      post :create, games_of_week: { awayTeam: @games_of_week.awayTeam, date: @games_of_week.date, gameID: @games_of_week.gameID, gameKey: @games_of_week.gameKey, homeTeam: @games_of_week.homeTeam, time: @games_of_week.time }
    end

    assert_redirected_to games_of_week_path(assigns(:games_of_week))
  end

  test "should show games_of_week" do
    get :show, id: @games_of_week
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @games_of_week
    assert_response :success
  end

  test "should update games_of_week" do
    patch :update, id: @games_of_week, games_of_week: { awayTeam: @games_of_week.awayTeam, date: @games_of_week.date, gameID: @games_of_week.gameID, gameKey: @games_of_week.gameKey, homeTeam: @games_of_week.homeTeam, time: @games_of_week.time }
    assert_redirected_to games_of_week_path(assigns(:games_of_week))
  end

  test "should destroy games_of_week" do
    assert_difference('GamesOfWeek.count', -1) do
      delete :destroy, id: @games_of_week
    end

    assert_redirected_to games_of_weeks_path
  end
end
