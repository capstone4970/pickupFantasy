json.array!(@test_actives) do |test_active|
  json.extract! test_active, :id, :active_state, :distance, :down, :minutes, :quarter, :seconds, :segment_number, :status, :status_id, :team_possession_id, :under_review, :yards_from_goal
  json.url test_active_url(test_active, format: :json)
end
