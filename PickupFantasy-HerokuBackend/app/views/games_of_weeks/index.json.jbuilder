json.array!(@games_of_weeks) do |games_of_week|
  json.extract! games_of_week, :id, :gameKey, :gameID, :time, :date, :homeTeam, :awayTeam
  json.url games_of_week_url(games_of_week, format: :json)
end
