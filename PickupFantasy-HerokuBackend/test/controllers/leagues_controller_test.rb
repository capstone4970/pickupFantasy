require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase
  setup do
    @league = leagues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leagues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create league" do
    assert_difference('League.count') do
      post :create, league: { gamesOfWeekIdentifier: @league.gamesOfWeekIdentifier, leagueID: @league.leagueID, member1: @league.member1, member2: @league.member2, member3: @league.member3, member4: @league.member4, member5: @league.member5, member6: @league.member6, name: @league.name, numPlayers: @league.numPlayers, password: @league.password }
    end

    assert_redirected_to league_path(assigns(:league))
  end

  test "should show league" do
    get :show, id: @league
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @league
    assert_response :success
  end

  test "should update league" do
    patch :update, id: @league, league: { gamesOfWeekIdentifier: @league.gamesOfWeekIdentifier, leagueID: @league.leagueID, member1: @league.member1, member2: @league.member2, member3: @league.member3, member4: @league.member4, member5: @league.member5, member6: @league.member6, name: @league.name, numPlayers: @league.numPlayers, password: @league.password }
    assert_redirected_to league_path(assigns(:league))
  end

  test "should destroy league" do
    assert_difference('League.count', -1) do
      delete :destroy, id: @league
    end

    assert_redirected_to leagues_path
  end
end
