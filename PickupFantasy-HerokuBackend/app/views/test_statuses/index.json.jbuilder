json.array!(@test_statuses) do |test_status|
  json.extract! test_status, :id, :active_state, :distance, :down, :minutes, :quarter, :seconds, :segment_number, :status, :status_id, :team_possession_id, :under_review, :yards_from_goal
  json.url test_status_url(test_status, format: :json)
end
