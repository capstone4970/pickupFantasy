require 'test_helper'

class WeekplayerdataControllerTest < ActionController::TestCase
  setup do
    @weekplayerdatum = weekplayerdata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weekplayerdata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weekplayerdatum" do
    assert_difference('Weekplayerdatum.count') do
      post :create, weekplayerdatum: { CurrentAuctionValue: @weekplayerdatum.CurrentAuctionValue, ExtraPoint: @weekplayerdatum.ExtraPoint, FantasyPoints: @weekplayerdatum.FantasyPoints, FieldGoal: @weekplayerdatum.FieldGoal, Fumbles: @weekplayerdatum.Fumbles, NFLPlayerID: @weekplayerdatum.NFLPlayerID, Passyds: @weekplayerdatum.Passyds, Rcvyds: @weekplayerdatum.Rcvyds, Rushyds: @weekplayerdatum.Rushyds, SlotID: @weekplayerdatum.SlotID, TDPass: @weekplayerdatum.TDPass, TDRcv: @weekplayerdatum.TDRcv, TDRush: @weekplayerdatum.TDRush, TwoPointPass: @weekplayerdatum.TwoPointPass, TwoPointRcv: @weekplayerdatum.TwoPointRcv, TwoPointRush: @weekplayerdatum.TwoPointRush }
    end

    assert_redirected_to weekplayerdatum_path(assigns(:weekplayerdatum))
  end

  test "should show weekplayerdatum" do
    get :show, id: @weekplayerdatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weekplayerdatum
    assert_response :success
  end

  test "should update weekplayerdatum" do
    patch :update, id: @weekplayerdatum, weekplayerdatum: { CurrentAuctionValue: @weekplayerdatum.CurrentAuctionValue, ExtraPoint: @weekplayerdatum.ExtraPoint, FantasyPoints: @weekplayerdatum.FantasyPoints, FieldGoal: @weekplayerdatum.FieldGoal, Fumbles: @weekplayerdatum.Fumbles, NFLPlayerID: @weekplayerdatum.NFLPlayerID, Passyds: @weekplayerdatum.Passyds, Rcvyds: @weekplayerdatum.Rcvyds, Rushyds: @weekplayerdatum.Rushyds, SlotID: @weekplayerdatum.SlotID, TDPass: @weekplayerdatum.TDPass, TDRcv: @weekplayerdatum.TDRcv, TDRush: @weekplayerdatum.TDRush, TwoPointPass: @weekplayerdatum.TwoPointPass, TwoPointRcv: @weekplayerdatum.TwoPointRcv, TwoPointRush: @weekplayerdatum.TwoPointRush }
    assert_redirected_to weekplayerdatum_path(assigns(:weekplayerdatum))
  end

  test "should destroy weekplayerdatum" do
    assert_difference('Weekplayerdatum.count', -1) do
      delete :destroy, id: @weekplayerdatum
    end

    assert_redirected_to weekplayerdata_path
  end
end
