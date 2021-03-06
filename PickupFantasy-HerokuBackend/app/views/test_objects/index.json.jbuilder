json.array!(@test_objects) do |test_object|
  json.extract! test_object, :id, :active, :away_team, :away_team_stats, :away_total_score, :created, :final, :finalbox, :game_code, :game_date_day, :game_date_epoch_time, :game_date_month, :game_date_time, :game_date_year, :game_location, :game_progress, :game_quarter_time, :game_status, :game_status_id, :game_type, :game_type_id, :global_id, :home_team, :home_team_stats, :home_total_score, :objects_id, :latest_play, :latest_plays, :line_score, :players, :possession, :resource_uri, :scoring_plays, :season, :slug, :status, :summary, :teams, :tv_station, :updated, :updated_epoch_time, :week
  json.url test_object_url(test_object, format: :json)
end
