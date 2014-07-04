json.array!(@seasons) do |season|
  json.extract! season, :id, :start_date, :period_duration
  json.url season_url(season, format: :json)
end
