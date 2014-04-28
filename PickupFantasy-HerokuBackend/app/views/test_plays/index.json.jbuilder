json.array!(@test_plays) do |test_play|
  json.extract! test_play, :id, :active, :assist1, :assist1_global_id, :assist1_id, :assist2, :assist2_global_id, :assist_id, :away_score_after, :away_score_before, :continuation, :details, :direction, :distance, :down, :drive_id, :end_possession, :end_yardline, :game, :game_time, :game_time_minute, :game_time_second, :home_score_after, :home_score_before, :play_id, :pass_defensed1, :pass_defensed1_id, :pat_type, :pat_value, :play_type, :play_type_id, :player1_global_id, :player1_id, :player2_global_id, :player2_id, :player3_global_id, :player3_id, :possession, :quarter, :resource_uri, :review_team, :review_team_global_id, :review_team_id, :score_description, :score_type, :scoring_play, :slug, :stats_id, :tackle1, :tackle1_global_id, :tackle1_id, :tackle2, :tackle2_global_id, :tackle2_id, :target, :target_id, :time, :true_time, :yardline, :yards
  json.url test_play_url(test_play, format: :json)
end
