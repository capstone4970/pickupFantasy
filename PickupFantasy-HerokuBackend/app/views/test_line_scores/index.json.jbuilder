json.array!(@test_line_scores) do |test_line_score|
  json.extract! test_line_score, :id, :extra, :quarter, :running_score, :score
  json.url test_line_score_url(test_line_score, format: :json)
end
