require 'test_helper'

class GamesofweeksControllerTest < ActionController::TestCase
  setup do
    @gamesofweek = gamesofweeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gamesofweeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gamesofweek" do
    assert_difference('Gamesofweek.count') do
      post :create, gamesofweek: { awayTeam: @gamesofweek.awayTeam, date: @gamesofweek.date, gameID: @gamesofweek.gameID, gameKey: @gamesofweek.gameKey, homeTeam: @gamesofweek.homeTeam, time: @gamesofweek.time }
    end

    assert_redirected_to gamesofweek_path(assigns(:gamesofweek))
  end

  test "should show gamesofweek" do
    get :show, id: @gamesofweek
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gamesofweek
    assert_response :success
  end

  test "should update gamesofweek" do
    patch :update, id: @gamesofweek, gamesofweek: { awayTeam: @gamesofweek.awayTeam, date: @gamesofweek.date, gameID: @gamesofweek.gameID, gameKey: @gamesofweek.gameKey, homeTeam: @gamesofweek.homeTeam, time: @gamesofweek.time }
    assert_redirected_to gamesofweek_path(assigns(:gamesofweek))
  end

  test "should destroy gamesofweek" do
    assert_difference('Gamesofweek.count', -1) do
      delete :destroy, id: @gamesofweek
    end

    assert_redirected_to gamesofweeks_path
  end
end
