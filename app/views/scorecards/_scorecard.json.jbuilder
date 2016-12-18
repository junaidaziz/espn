json.extract! scorecard, :id, :url, :batting_id, :bowling_id, :created_at, :updated_at
json.url scorecard_url(scorecard, format: :json)