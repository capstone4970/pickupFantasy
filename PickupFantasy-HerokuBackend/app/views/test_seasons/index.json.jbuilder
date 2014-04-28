json.array!(@test_seasons) do |test_season|
  json.extract! test_season, :id, :active, :created, :end_date, :season_id, :name, :resource_uri, :slug, :start_date, :updated, :year
  json.url test_season_url(test_season, format: :json)
end
