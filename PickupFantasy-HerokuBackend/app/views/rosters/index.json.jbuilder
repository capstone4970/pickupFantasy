json.array!(@rosters) do |roster|
  json.extract! roster, :id, :rosterID, :username, :leagueID, :qb, :flex, :k, :wr, :rb
  json.url roster_url(roster, format: :json)
end
