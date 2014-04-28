json.array!(@weekplayerdata) do |weekplayerdatum|
  json.extract! weekplayerdatum, :id, :NFLPlayerID, :SlotID, :CurrentAuctionValue, :FantasyPoints, :Passyds, :Rushyds, :Rcvyds, :Fumbles, :TDPass, :TwoPointPass, :TwoPointRush, :TDRush, :TDRcv, :TwoPointRcv, :ExtraPoint, :FieldGoal
  json.url weekplayerdatum_url(weekplayerdatum, format: :json)
end
