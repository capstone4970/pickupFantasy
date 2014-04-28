json.array!(@users) do |user|
  json.extract! user, :id, :userID, :username, :phoneCred, :won, :lost, :previousGamePlace, :leagueName, :rosterID
  json.url user_url(user, format: :json)
end
