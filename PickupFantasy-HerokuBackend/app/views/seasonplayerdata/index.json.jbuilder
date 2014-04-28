json.array!(@seasonplayerdata) do |seasonplayerdatum|
  json.extract! seasonplayerdatum, :id, :NFLPlayerID, :cbsID, :nerdID, :CurrentTeam, :FantasyPosition, :Number, :FirstName, :LastName, :InitialAuctionValue, :CurrentAuctionValue, :projFantasyPoints, :projFantasyPointsMark, :LastPlayedPoints
  json.url seasonplayerdatum_url(seasonplayerdatum, format: :json)
end
