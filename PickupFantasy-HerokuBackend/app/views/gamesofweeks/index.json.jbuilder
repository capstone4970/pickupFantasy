json.array!(@gamesofweeks) do |gamesofweek|
  json.extract! gamesofweek, :id, :gameKey, :gameID, :time, :date, :homeTeam, :awayTeam
  json.url gamesofweek_url(gamesofweek, format: :json)
end
