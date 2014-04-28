json.array!(@test_teams) do |test_team|
  json.extract! test_team, :id, :active, :alias, :city, :conference, :conference_id, :created, :division, :division_id, :global_id, :team_id, :local_team, :logo_120x120, :logo_30x30, :logo_40x40, :logo_60x60, :name, :primary_color, :record, :resource_uri, :secondary_color, :slug, :stats_id, :total_defensive_rank, :total_offensive_rank, :total_passing_defense_rank, :total_passing_offense_rank, :total_rushing_defense_rank, :total_rushing_offense_rank, :updated
  json.url test_team_url(test_team, format: :json)
end
