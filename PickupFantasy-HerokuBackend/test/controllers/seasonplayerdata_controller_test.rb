require 'test_helper'

class SeasonplayerdataControllerTest < ActionController::TestCase
  setup do
    @seasonplayerdatum = seasonplayerdata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasonplayerdata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seasonplayerdatum" do
    assert_difference('Seasonplayerdatum.count') do
      post :create, seasonplayerdatum: { CurrentAuctionValue: @seasonplayerdatum.CurrentAuctionValue, CurrentTeam: @seasonplayerdatum.CurrentTeam, FantasyPosition: @seasonplayerdatum.FantasyPosition, FirstName: @seasonplayerdatum.FirstName, InitialAuctionValue: @seasonplayerdatum.InitialAuctionValue, LastName: @seasonplayerdatum.LastName, LastPlayedPoints: @seasonplayerdatum.LastPlayedPoints, NFLPlayerID: @seasonplayerdatum.NFLPlayerID, Number: @seasonplayerdatum.Number, cbsID: @seasonplayerdatum.cbsID, nerdID: @seasonplayerdatum.nerdID, projFantasyPoints: @seasonplayerdatum.projFantasyPoints, projFantasyPointsMark: @seasonplayerdatum.projFantasyPointsMark }
    end

    assert_redirected_to seasonplayerdatum_path(assigns(:seasonplayerdatum))
  end

  test "should show seasonplayerdatum" do
    get :show, id: @seasonplayerdatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seasonplayerdatum
    assert_response :success
  end

  test "should update seasonplayerdatum" do
    patch :update, id: @seasonplayerdatum, seasonplayerdatum: { CurrentAuctionValue: @seasonplayerdatum.CurrentAuctionValue, CurrentTeam: @seasonplayerdatum.CurrentTeam, FantasyPosition: @seasonplayerdatum.FantasyPosition, FirstName: @seasonplayerdatum.FirstName, InitialAuctionValue: @seasonplayerdatum.InitialAuctionValue, LastName: @seasonplayerdatum.LastName, LastPlayedPoints: @seasonplayerdatum.LastPlayedPoints, NFLPlayerID: @seasonplayerdatum.NFLPlayerID, Number: @seasonplayerdatum.Number, cbsID: @seasonplayerdatum.cbsID, nerdID: @seasonplayerdatum.nerdID, projFantasyPoints: @seasonplayerdatum.projFantasyPoints, projFantasyPointsMark: @seasonplayerdatum.projFantasyPointsMark }
    assert_redirected_to seasonplayerdatum_path(assigns(:seasonplayerdatum))
  end

  test "should destroy seasonplayerdatum" do
    assert_difference('Seasonplayerdatum.count', -1) do
      delete :destroy, id: @seasonplayerdatum
    end

    assert_redirected_to seasonplayerdata_path
  end
end
