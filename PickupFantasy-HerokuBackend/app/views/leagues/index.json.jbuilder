json.array!(@leagues) do |league|
  json.extract! league, :id, :leagueID, :name, :password, :numPlayers, :member1, :member2, :member3, :member4, :member5, :member6, :gamesOfWeekIdentifier
  json.url league_url(league, format: :json)
end
